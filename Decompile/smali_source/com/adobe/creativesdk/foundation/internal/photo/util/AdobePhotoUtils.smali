.class public Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;
.super Ljava/lang/Object;
.source "AdobePhotoUtils.java"


# direct methods
.method public static JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 9
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
        }
    .end annotation

    .prologue
    .line 48
    const/4 v1, 0x0

    .line 51
    .local v1, "jsonData":Lorg/json/JSONObject;
    :try_start_1
    const-string v4, "while \\(1\\) \\{\\}"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 52
    .local v3, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 53
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 54
    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 56
    :cond_1b
    new-instance v1, Lorg/json/JSONObject;

    .end local v1    # "jsonData":Lorg/json/JSONObject;
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_20} :catch_21

    .line 61
    .restart local v1    # "jsonData":Lorg/json/JSONObject;
    return-object v1

    .line 57
    .end local v1    # "jsonData":Lorg/json/JSONObject;
    .end local v2    # "matcher":Ljava/util/regex/Matcher;
    .end local v3    # "pattern":Ljava/util/regex/Pattern;
    :catch_21
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const/4 v6, 0x0

    const-string v7, "Parsed collection data is not of type dictionary."

    invoke-direct {v4, v5, v6, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    throw v4
.end method

.method public static generateGUID()Ljava/lang/String;
    .registers 4

    .prologue
    .line 39
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    .line 40
    .local v1, "uuid":Ljava/util/UUID;
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "randomUUIDString":Ljava/lang/String;
    const-string v2, "-"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 43
    return-object v0
.end method
