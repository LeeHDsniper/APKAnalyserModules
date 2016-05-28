#ifndef MANIFESTANALYSIS_H
#define MANIFESTANALYSIS_H

struct Manifest_Anal
{
	std::string	Issue;
	std::string	Severity;
	std::string	Description;
};
struct  Exported_Count
{
	int& operator [](std::string key); 
	int	Activity_Count;
	int	Provider_Count;
	int	Receiver_Count;
	int	Service_Count;
};


/*@
 * Global variables
 */
extern Manifest_Anal	RET[128];
extern std::string	EXPORTED[128];
extern Exported_Count	exp_count;


void ManifestAnalysis( std::string xml_path, std::string main_activity );
#endif