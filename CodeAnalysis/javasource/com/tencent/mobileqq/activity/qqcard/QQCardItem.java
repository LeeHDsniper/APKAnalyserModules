package com.tencent.mobileqq.activity.qqcard;

import QCARD.CouponMobileItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.ConflictClause;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.uniqueConstraints;
import org.json.JSONException;
import org.json.JSONObject;

@uniqueConstraints(clause=ConflictClause.IGNORE, columnNames="cardId,code,field")
public class QQCardItem
  extends Entity
{
  public String bgUrl;
  public String brand;
  public String cardId;
  public String code;
  public String distance;
  public long expireTime;
  public int field;
  public int folderId;
  public int fromColor;
  public String iconUrl;
  @notColumn
  public boolean isNew;
  public int isValid;
  @notColumn
  public int itemType;
  public String jumpUrl;
  public int status;
  public String subTitle;
  public String title;
  public int validTipsColor;
  public String validTipsFormat;
  
  public QQCardItem()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    bgUrl = null;
    validTipsColor = -1;
    fromColor = -1;
  }
  
  public QQCardItem(CouponMobileItem paramCouponMobileItem, int paramInt1, int paramInt2)
  {
    bgUrl = null;
    validTipsColor = -1;
    fromColor = -1;
    folderId = paramInt2;
    itemType = paramInt1;
    setValue(paramCouponMobileItem);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof QQCardItem))
    {
      paramObject = (QQCardItem)paramObject;
      if ((cardId.equals(cardId)) && (code.equals(code)) && (field == field)) {
        return true;
      }
    }
    return false;
  }
  
  public boolean equalsId(String paramString)
  {
    return (field + "_" + cardId + "_" + code).equals(paramString);
  }
  
  public String getTableName()
  {
    return "t_qqcard_item";
  }
  
  public void setValue(CouponMobileItem paramCouponMobileItem)
  {
    cardId = card_id;
    code = code;
    field = field;
    status = status;
    title = title;
    subTitle = sub_title;
    brand = from;
    validTipsFormat = valid_tips_format;
    expireTime = expire_time;
    iconUrl = icon_url;
    jumpUrl = jump_url;
    try
    {
      JSONObject localJSONObject = new JSONObject(style_json_str);
      if (localJSONObject.has("background_url")) {
        bgUrl = localJSONObject.getString("background_url");
      }
      if (localJSONObject.has("valid_tips_color")) {
        validTipsColor = localJSONObject.getInt("valid_tips_color");
      }
      if (localJSONObject.has("from_color")) {
        fromColor = localJSONObject.getInt("from_color");
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
    distance = distance;
    isValid = is_valid;
  }
}
