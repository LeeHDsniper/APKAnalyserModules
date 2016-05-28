.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;
.super Ljava/lang/Object;
.source "AdobeJSONObject.java"


# instance fields
.field jsonObject:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->jsonObject:Lorg/json/JSONObject;

    .line 29
    return-void
.end method


# virtual methods
.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 33
    const/4 v1, 0x0

    .line 34
    .local v1, "value":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 37
    :try_start_9
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_e} :catch_10

    move-result-object v1

    .line 44
    :cond_f
    :goto_f
    return-object v1

    .line 38
    :catch_10
    move-exception v0

    .line 39
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_f
.end method

.method public has(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
