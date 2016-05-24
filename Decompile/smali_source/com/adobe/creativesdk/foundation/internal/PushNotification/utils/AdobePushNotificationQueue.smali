.class public Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;
.super Ljava/lang/Object;
.source "AdobePushNotificationQueue.java"


# static fields
.field public static _pushNotificationQueue:Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;


# instance fields
.field private _notificationMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_notificationMap:Ljava/util/HashMap;

    .line 21
    return-void
.end method

.method public static getPushNotificationQueue()Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_pushNotificationQueue:Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;

    if-nez v0, :cond_b

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_pushNotificationQueue:Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;

    .line 28
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_pushNotificationQueue:Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;

    return-object v0
.end method


# virtual methods
.method public getReadNotificationsList()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v1, "notificationIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_notificationMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .line 71
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 73
    .end local v0    # "notification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    :cond_1f
    return-object v1
.end method

.method public handleNotificationResponse(Lorg/json/JSONObject;)V
    .registers 9
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 43
    :try_start_0
    const-string v6, "notifications"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 44
    .local v5, "outerContainer":Lorg/json/JSONObject;
    const-string v6, "notification"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 45
    .local v2, "innerContainer":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_29

    .line 47
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 48
    .local v3, "notification":Lorg/json/JSONObject;
    const-string v6, "notification-id"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 49
    .local v4, "notificationID":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_notificationMap:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_22} :catch_25

    .line 45
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 51
    .end local v1    # "i":I
    .end local v2    # "innerContainer":Lorg/json/JSONArray;
    .end local v3    # "notification":Lorg/json/JSONObject;
    .end local v4    # "notificationID":Ljava/lang/String;
    .end local v5    # "outerContainer":Lorg/json/JSONObject;
    :catch_25
    move-exception v0

    .line 52
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 54
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_29
    return-void
.end method

.method public putNotificationInQueue(Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1d

    .line 33
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->_notificationMap:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 35
    :cond_1d
    return-void
.end method
