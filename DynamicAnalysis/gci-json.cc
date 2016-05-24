#include "gci-json.h"
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <sstream>
#include <algorithm>

namespace ggicci
{
using namespace std;

/* Json */
Json Json::Parse(const char* json_string)
{
	Parser parser(json_string);
	Json *json = parser.ConsumeValue(false);
	Json retval(json);
	delete json;
	return retval;
}

Json::Json() : kind_(kNull), data_(0) { }
Json::Json(int num) : kind_(kNumber), data_(new double(num)) { }
Json::Json(double num) : kind_(kNumber), data_(new double(num)) { }
Json::Json(const string& str) : kind_(kString), data_(new string(str)) { }
Json::Json(const char* str) : kind_(kString), data_(new string(str)) { }
Json::Json(bool boo) : kind_(kBool), data_(new bool(boo)) { }
Json::Json(const Json& rhs) : kind_(kNull), data_(0)
{
	TRACK("Json::Json(const Json& rhs)");
	DoDeepCopy(rhs);
}

Json& Json::operator = (const Json& rhs)
{
	TRACK("Json& Json::operator = (const Json& rhs)");
	if (this == &rhs) { return *this; }
	Release();
	DoDeepCopy(rhs);
	return *this;
}

Json::Json(Json* rhs) : kind_(rhs->kind_), data_(rhs->data_)
{
	TRACK("Json::Json(Json* rhs)");
	rhs->data_ = 0;
}

Json::Json(ObjectData* obj) : kind_(kObject), data_(obj) { }
Json::Json(ArrayData* arr) : kind_(kArray), data_(arr) { }

void Json::DoDeepCopy(const Json& rhs)
{
	TRACK("void Json::DoDeepCopy(const Json& rhs)");
	kind_ = rhs.kind_;
	switch (kind_)
	{
		case kNull: data_ = 0; break;
		case kNumber: data_ = new double(*static_cast<const double*>(rhs.data_)); break;
		case kString: data_ = new string(*static_cast<const string*>(rhs.data_)); break;
		case kBool: data_ = new bool(*static_cast<const bool*>(rhs.data_)); break;
		case kArray:
		{
			ArrayData *tmp = new ArrayData();
			const ArrayData& data = *CAST_JSON_ARR(rhs.data_);
			ArrayData::const_iterator cit = data.begin();
			for (; cit != data.end(); ++cit)
			{
				tmp->push_back(new Json(*(*cit)));
			}
			data_ = tmp;
			break;
		}
		case kObject:
		{
			ObjectData *tmp = new ObjectData();
			const ObjectData& data = *CAST_JSON_OBJ(rhs.data_);
			ObjectData::const_iterator cit = data.begin();
			for (; cit != data.end(); ++cit)
			{
				tmp->insert(make_pair(cit->first, new Json(*cit->second)));
			}
			data_ = tmp;
			break;
		}
		default: break;
	}
}

void Json::Release()
{
	TRACK("void Json::Release()");
	TRACK("----------------------------------- Delete[" << kind_ << "]: " << ToString());
	switch (kind_)
	{
		case kNumber: delete static_cast<double*>(data_); break;
		case kString: delete static_cast<string*>(data_); break;
		case kBool: delete static_cast<bool*>(data_); break;
		case kObject:
		{
			Json::DestroyObjectData(*CAST_JSON_OBJ(data_));
			delete CAST_JSON_OBJ(data_);
			break;
		}
		case kArray:
		{
			Json::DestroyArrayData(*CAST_JSON_ARR(data_));
			delete CAST_JSON_ARR(data_);
			break;
		}
		default: break;
	}
	data_ = 0;
	kind_ = kNull;
}

Json::~Json()
{
	TRACK("~Json");
	if (!data_) { return; }
	Release();
}

bool Json::IsEmpty() const
{
	if (IsObject()) { return CAST_JSON_OBJ(data_)->size() == 0; }
	if (IsArray()) { return CAST_JSON_ARR(data_)->size() == 0; }
	return false;
}

bool Json::Contains(const char* key) const
{
	if (!IsObject()) { return false; }
	const ObjectData &data = *CAST_JSON_OBJ(data_);
	return data.find(key) != data.end();
}

int Json::Size() const
{
	if (!IsArray()) { return 1; } 
	return CAST_JSON_ARR(data_)->size();
}

vector<std::string> Json::Keys() const
{
	vector<string> keys;
	if (IsObject())
	{
		ObjectData *data = CAST_JSON_OBJ(data_);
		ObjectData::const_iterator cit = data->begin();
		for (; cit != data->end(); ++cit)
		{
			keys.push_back(cit->first);
		}
	}
	return keys;
}

Json& Json::Push(const Json& rhs)
{
	TRACK("Json& Json::Push(const Json& rhs)");
	switch (kind_)
	{
		case kArray:
		{
			ArrayData *data = CAST_JSON_ARR(data_);
			data->push_back(new Json(rhs));
			break;
		}
		case kNumber: case kString: case kBool: case kNull: case kObject:
		{
			Json* old = new Json(this);
			kind_ = Json::kArray;
			ArrayData *tmp = new ArrayData();
			tmp->push_back(old);
			tmp->push_back(new Json(rhs));
			data_ = tmp;
			break;
		}
		default: break;
	}
	return *this;
}

Json& Json::AddProperty(const std::string& key, const Json& value)
{
	TRACK("Json& Json::AddProperty(const std::string& key, const Json& value)");
	(*this)[key.c_str()] = value;
	return *this;
}

Json& Json::Remove(const std::string& key)
{
	TRACK("Json& Json::Remove(const std::string& key)");
	ObjectData& data = Data<ObjectData>();
	ObjectData::iterator it = data.find(key);
	if (it != data.end())
	{
		delete it->second;
		data.erase(it);
	}
	return *this;
}

void Json::Remove(int index)
{
	TRACK("void Json::Remove(int index)");
	ArrayData& data = Data<ArrayData>();
	if (index >= 0 && index < Size())
	{
		ArrayData::iterator it = data.begin() + index;
		delete (*it);
		data.erase(it);
	}
}

int Json::AsInt() const
{
	return (int)Data<double>();
}

double Json::AsDouble() const
{
	return Data<double>();
}

bool Json::AsBool() const
{
	return Data<bool>();
}

string Json::AsString() const
{
	return Data<string>().c_str();
}

const Json& Json::operator [] (int index) const
{
	return *Data<ArrayData>()[index];
}

Json& Json::operator [] (int index)
{
	return *Data<ArrayData>()[index];
}

const Json& Json::operator[] (const char* key) const
{
	ObjectData& data = const_cast<ObjectData&>(Data<ObjectData>());
	if (data.find(key) == data.end()) { data[key] = new Json(); }
	return *(data[key]);
}

Json& Json::operator[] (const char* key)
{
	return const_cast<Json&>(static_cast<const Json&>(*this)[key]);
}

Json& Json::operator = (int num)
{
	return operator = ((double)num);
}

Json& Json::operator = (double num)
{
	Release();
	kind_ = kNumber;
	data_ = new double(num);
	return *this;
}

Json& Json::operator = (const string& str)
{
	return operator = (str.c_str());
}

Json& Json::operator = (const char* str)
{
	Release();
	kind_ = kString;
	data_ = new string(str);
	return *this;
}

Json& Json::operator = (bool boo)
{
	Release();
	kind_ = kBool;
	data_ = new bool(boo);
	return *this;
}

string Json::ToString() const
{
	ostringstream oss;
	switch (kind_)
	{
		case kNumber: oss << *static_cast<double*>(data_); break;
		case kString: oss << "\"" << *static_cast<string*>(data_) << "\""; break;
		case kBool: oss << boolalpha << *static_cast<bool*>(data_); break;
		case kNull: oss << "null"; break;
		case kObject:
		{
			ObjectData& data = *CAST_JSON_OBJ(data_);
			ObjectData::const_iterator cit = data.begin();
			oss << "{ ";
			bool unique = true;
			for (; cit != data.end(); ++cit)
			{
				oss << (unique ? "\"" : ", \"") << cit->first << "\": " << cit->second->ToString();
				unique = false;
			}
			oss << " }";
			break;
		}
		case kArray:
		{
			ArrayData& data = *CAST_JSON_ARR(data_);
			ArrayData::const_iterator cit = data.begin();
			oss << "[ ";
			bool unique = true;
			for (; cit != data.end(); ++cit)
			{
				oss << (unique ? "" : ", ") << (*cit)->ToString();
				unique = false;
			}
			oss << " ]";
			break;
		}
		default : break;
	}
	return oss.str();
}

/* Private Members */
void Json::DestroyArrayData(ArrayData& arr)
{
	TRACK("void Json::DestroyArrayData(ArrayData& arr)");
	for (ArrayData::iterator it = arr.begin(); it != arr.end(); ++it)
	{
		delete *it;
		*it = 0;
	}
}

void Json::DestroyObjectData(ObjectData& obj)
{
	TRACK("void Json::DestroyObjectData(ObjectData& obj)");
	for (ObjectData::iterator it = obj.begin(); it != obj.end(); ++it)
	{
		delete it->second;
		it->second = 0;
	}
}

/* Json::Parser */
Json::Parser::Parser(const char* json_string)
{
	source = json_string;
	pos = -1;
	character = ' ';
	token = "";
}

Json* Json::Parser::ConsumeValue(bool section/* = true */)
{
	TRACK("Json Json::Parser::ConsumeValue()");
	SkipWhitespaces();
	Kind kind = KindDetect();
	Json* (Json::Parser::*consumer)(); // member function pointer
	switch (kind)
	{
		case kNumber: { consumer = &Json::Parser::ConsumeNumber; break; }
		case kString: { consumer = &Json::Parser::ConsumeString; break; }
		case kBool: { consumer = &Json::Parser::ConsumeBool; break; }
		case kNull: { consumer = &Json::Parser::ConsumeNull; break; }
		case kObject: { consumer = &Json::Parser::ConsumeObject; break; }
		case kArray: { consumer = &Json::Parser::ConsumeArray; break; }
		default: { throw; break; }
	}
	Json *json = (this->*consumer)();
	if (!section && !EOL())
	{
		SkipWhitespaces();
		NextCharacter();
		if (!EOL()) { UnexpectedToken(); }
	}
	if (section) { SkipWhitespaces(); }
	return json;
} // end fn:ConsumeValue

Json* Json::Parser::ConsumeNumber()
{
	TRACK("Json* Json::Parser::ConsumeNumber()");
	token = "";
	NextCharacter();
	// negative
	if ('-' == character) { Concat(); NextCharacter(); }
	bool loop = true;
	bool dot = false;
	if (!isdigit(character)) { UnexpectedToken(); }
	Concat(); // the first digit or after '-'
	if ('0' == character) {  loop = false; }
	while (loop) // * loop
	{
		if (!isdigit(NextCharacter())) { Retract(); break; }
		Concat();
	}
	if (isdigit(NextCharacter())) { UnexpectedToken(); } // fix 000.3
	if ('.' == character) { Concat(); dot = true; }
	if (dot) // met '.', at least need one digit
	{
		if (!isdigit(NextCharacter())) { UnexpectedToken(); }
		Concat();
	}
	while (dot) // * loop
	{
		NextCharacter();
		if (!isdigit(character)) { break; }
		Concat();
	}
	// confront with scientific notation
	if ('e' == character || 'E' == character)
	{
		Concat();
		NextCharacter();
		if ('+' == character || '-' == character) { Concat(); }
		else if (isdigit(character)) { Retract(); }
		else { UnexpectedToken(); }
		// at least need one digit after '+' or '-' or 'E' or 'e'
		if (!isdigit(NextCharacter())) { UnexpectedToken(); }
		Concat();
		while (true)
		{
			NextCharacter();
			// if (EOL() || isspace(character)) { break; }
			if (!isdigit(character)) { Retract(); break; }
			Concat();
		}
	}
	else
	{
		Retract();
	}
	// else if (EOL() || isspace(character)) { ; } 
	// else { UnexpectedToken(); } // fix -23.0s
	return new Json(atof(token.c_str()));
} // end fn:ConsumeNumber

Json* Json::Parser::ConsumeString()
{
	TRACK("Json* Json::Parser::ConsumeString()");
	SkipWhitespaces();
	// consume the open quote
	if ('\"' != NextCharacter()) { UnexpectedToken(); }
	token = "";
	while (true)
	{
		// meet the close quote, end loop
		if ('\"' == NextCharacter()) { break; }
		// the escape characters
		if ('\\' == character)
		{
			Concat();
			NextCharacter();
			switch (character)
			{
				case '\"': case '\\': case '/': case 'b':
				case 'f': case 'n': case 'r': case 't':
				{
					Concat();
					break;
				}
				case 'u':
				{
					Concat();
					for (int i = 0; i < 4; ++i)
					{
						if (!isxdigit(NextCharacter()))
						{
							UnexpectedToken();
						}
						Concat();
					}
					break;
				}
				default:
				{
					UnexpectedToken();
					break;
				}
			}
		}
		else // if not a escape character
		{
			if (iscntrl(character)) { UnexpectedToken(); }
			Concat();
		}
	}
	return new Json(token);
} // end fn:ConsumeString

Json* Json::Parser::ConsumeBool()
{
	TRACK("Json* Json::Parser::ConsumeBool()");
	char ch = NextCharacter();
	Retract();
	if ('t' == ch) { ConsumeSpecific("true"); return new Json(true); }
	else { ConsumeSpecific("false"); return new Json(false); }
} // end fn:ConsumeBool

Json* Json::Parser::ConsumeNull()
{
	TRACK("Json* Json::Parser::ConsumeNull()");
	ConsumeSpecific("null");
	return new Json();
} // end fn:ConsumeNull

Json* Json::Parser::ConsumeObject()
{
	TRACK("Json* Json::Parser::ConsumeObject()");
	ObjectData *obj = new ObjectData();
	if ('{' != NextCharacter()) { UnexpectedToken(); }
	SkipWhitespaces();
	if ('}' == NextCharacter()) { ; } // empty object
	else // at least need one pair
	{
		Retract();
		try { obj->insert(ConsumePair()); }
		catch (exception& e)
		{
			Json::DestroyObjectData(*obj);
			delete obj;
			UnexpectedToken();
		}
		while (true) // * loop
		{
			if ('}' == NextCharacter()) { break; }
			else if (',' == character)
			{ 
				try { obj->insert(ConsumePair()); }
				catch (exception& e)
				{
					Json::DestroyObjectData(*obj);
					delete obj;
					UnexpectedToken();
				}
			}
			else
			{
				Json::DestroyObjectData(*obj);
				delete obj;
				UnexpectedToken();
			}
		}
	}
	return new Json(obj);
} // end fn:ConsumeObject

Json* Json::Parser::ConsumeArray()
{
	TRACK("Json* Json::Parser::ConsumeArray()");
	ArrayData *arr = new ArrayData();
	if ('[' != NextCharacter()) { UnexpectedToken(); }
	SkipWhitespaces();
	if (']' == NextCharacter()) { ; } // empty array
	else // at least one value
	{
		Retract();
		try { arr->push_back(ConsumeValue()); }
		catch (exception& e)
		{
			Json::DestroyArrayData(*arr);
			delete arr;
			UnexpectedToken();
		}
		while (true) // * loop
		{
			if (']' == NextCharacter()) { break; }
			else if (',' == character) {
				try { arr->push_back(ConsumeValue()); }
				catch(exception& e)
				{
					Json::DestroyArrayData(*arr);
					delete arr;
					UnexpectedToken();
				}
			}
			else
			{
				Json::DestroyArrayData(*arr);
				delete arr;
				UnexpectedToken();
			}
		}
	}
	return new Json(arr);
} // end fn: Consume Array

Json::Pair Json::Parser::ConsumePair()
{
	TRACK("Json::Parser::Pair Json::Parser::ConsumePair()");
	Json* pkey = ConsumeString();
	string key(pkey->AsString());
	delete pkey;
	SkipWhitespaces();
	ConsumeSpecific(":");
	Json *value = ConsumeValue();
	return make_pair(key, value);
} // end fn:ConsumePair

void Json::Parser::ConsumeSpecific(const char* str)
{
	TRACK("void Json::Parser::ConsumeSpecific(const char* str)");
	int len = char_traits<char>::length(str);
	for (int i = 0; i < len; ++i)
	{
		if (str[i] != NextCharacter()) { UnexpectedToken(); }
	}
} // end fn:ConsumeSpeciffic

Json::Kind Json::Parser::KindDetect()
{
	Json::Kind kind = Json::kNumber;
	switch (NextCharacter())
	{
		case '\"': { kind = Json::kString; break; }
		case 't': case 'f': { kind = Json::kBool; break; }
		case 'n': { kind = Json::kNull; break; }
		case '{': { kind = Json::kObject; break; }
		case '[': { kind = Json::kArray; break; }
		default: break; // treat as number (will cause exception)
	}
	Retract();
	return kind;
}

void Json::Parser::SkipWhitespaces()
{
	char ch;
	while (true)
	{
		ch = NextCharacter();
		if (' ' == ch || '\t' == ch || '\n' == ch || '\r' == ch) { ; }
		else { pos--; break; }
	}
}

void Json::Parser::UnexpectedToken() { throw Json::UnexpectedTokenException(character, pos); }

/* Json::UnexpectedTokenException */
Json::UnexpectedTokenException::UnexpectedTokenException(char ch, int pos)
	:exception(), ch_(ch), pos_(pos)
{
	ostringstream oss;
	if ('\0' == ch_)
	{
		oss << "SyntaxError: Unexpected end of input";
	}
	else
	{
		oss << "SyntaxError: Unexpected token ";
		if (isgraph(ch_)) { oss << ch_; }
		else { oss << (int)ch_ << "(ASCII)"; }
		oss << " at pos " << pos_;
	}
	msg_ = oss.str();
}

Json::UnexpectedTokenException::~UnexpectedTokenException() throw() {}

const char* Json::UnexpectedTokenException::what() const throw()
{
	return msg_.c_str();
}

}
