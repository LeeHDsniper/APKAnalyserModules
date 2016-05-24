.class public Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;
.super Ljava/lang/Object;
.source "AdobePushNotificationModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$1;,
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$NotificationComparator;
    }
.end annotation


# static fields
.field private static populateSharedPreferences:Z


# instance fields
.field private _activitiesList:Ljava/util/HashMap;
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

.field private _assetCommentsCount:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
            ">;>;"
        }
    .end annotation
.end field

.field private _invitationList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;",
            ">;"
        }
    .end annotation
.end field

.field private pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->populateSharedPreferences:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    .line 33
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->getSharedNotificationDataModel()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->clearSharedPreferences()V

    .line 35
    return-void
.end method

.method public static clearSharedPreference()V
    .registers 1

    .prologue
    .line 155
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->getSharedNotificationDataModel()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    move-result-object v0

    .line 156
    .local v0, "sharedPrefencesModel":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;
    if-eqz v0, :cond_9

    .line 157
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->clearSharedPreferences()V

    .line 158
    :cond_9
    return-void
.end method

.method private static getCommentNotification(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;
    .registers 7
    .param p0, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 351
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;-><init>()V

    .line 352
    .local v1, "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;
    const-string v4, "asset"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 353
    .local v0, "folder":Lorg/json/JSONObject;
    if-eqz v0, :cond_28

    .line 354
    const-string v4, "region"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setRegion(Ljava/lang/String;)V

    .line 355
    const-string v4, "name"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setResourceName(Ljava/lang/String;)V

    .line 356
    const-string v4, "url"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 357
    .local v2, "url":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setResourceURL(Ljava/lang/String;)V

    .line 359
    .end local v2    # "url":Ljava/lang/String;
    :cond_28
    const-string v4, "user"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 360
    .local v3, "user":Lorg/json/JSONObject;
    if-eqz v3, :cond_6d

    .line 361
    const-string v4, "firstName"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setFirstName(Ljava/lang/String;)V

    .line 362
    const-string v4, "lastName"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setLastName(Ljava/lang/String;)V

    .line 363
    const-string v4, "userId"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setAdobeID(Ljava/lang/String;)V

    .line 364
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->getFirstName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->getLastName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setDisplayName(Ljava/lang/String;)V

    .line 366
    :cond_6d
    return-object v1
.end method

.method private getCurrentTime()J
    .registers 3

    .prologue
    .line 346
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 347
    .local v0, "currentTimestamp":J
    return-wide v0
.end method

.method private static getInvitationNotification(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;
    .registers 5
    .param p0, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 370
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;-><init>()V

    .line 371
    .local v1, "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;
    const-string v3, "folder"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 372
    .local v0, "folder":Lorg/json/JSONObject;
    if-eqz v0, :cond_28

    .line 373
    const-string v3, "region"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setRegion(Ljava/lang/String;)V

    .line 374
    const-string v3, "name"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setResourceName(Ljava/lang/String;)V

    .line 375
    const-string v3, "url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setResourceURL(Ljava/lang/String;)V

    .line 377
    :cond_28
    const-string v3, "user"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 378
    .local v2, "user":Lorg/json/JSONObject;
    if-eqz v2, :cond_54

    .line 379
    const-string v3, "firstName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setFirstName(Ljava/lang/String;)V

    .line 380
    const-string v3, "lastName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setLastName(Ljava/lang/String;)V

    .line 381
    const-string v3, "userId"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setAdobeID(Ljava/lang/String;)V

    .line 382
    const-string v3, "displayName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;->setDisplayName(Ljava/lang/String;)V

    .line 384
    :cond_54
    return-object v1
.end method

.method private getPayloadObjectForSharedPref(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "notification"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .prologue
    .line 457
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 458
    .local v1, "payLoadObj":Lorg/json/JSONObject;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationType()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_ba

    .line 494
    const/4 v1, 0x0

    .end local v1    # "payLoadObj":Lorg/json/JSONObject;
    .end local p1    # "notification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    :goto_15
    return-object v1

    .line 461
    .restart local v1    # "payLoadObj":Lorg/json/JSONObject;
    .restart local p1    # "notification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    :pswitch_16
    :try_start_16
    const-string v2, "state"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getLocalState()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 462
    const-string v2, "region"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getRegion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 463
    const-string v2, "assetUrl"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getResourceURL()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 464
    const-string v2, "assetName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getResourceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 465
    const-string v2, "senderName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 466
    const-string v2, "user-Id"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getAdobeID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 467
    const-string v2, "timestamp"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 468
    const-string v2, "comment"

    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;

    .end local p1    # "notification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->getComment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_64
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_64} :catch_65

    goto :goto_15

    .line 470
    :catch_65
    move-exception v0

    .line 471
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_15

    .line 476
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local p1    # "notification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    :pswitch_6a
    :try_start_6a
    const-string v2, "UserName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_73
    .catch Lorg/json/JSONException; {:try_start_6a .. :try_end_73} :catch_b5

    .line 482
    :goto_73
    :pswitch_73
    :try_start_73
    const-string v2, "state"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getLocalState()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 483
    const-string v2, "region"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getRegion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 484
    const-string v2, "folderUrl"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getResourceURL()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 485
    const-string v2, "folderName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getResourceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 486
    const-string v2, "user-Id"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getAdobeID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 487
    const-string v2, "timestamp"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_ad
    .catch Lorg/json/JSONException; {:try_start_73 .. :try_end_ad} :catch_af

    goto/16 :goto_15

    .line 489
    :catch_af
    move-exception v0

    .line 490
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_15

    .line 477
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_b5
    move-exception v0

    .line 478
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_73

    .line 458
    :pswitch_data_ba
    .packed-switch 0x1
        :pswitch_73
        :pswitch_6a
        :pswitch_16
    .end packed-switch
.end method

.method private getSelfAdobeID()Ljava/lang/String;
    .registers 3

    .prologue
    .line 423
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 424
    .local v0, "identityManagementService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private insertNewActivityIntoSharedPref(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)V
    .registers 7
    .param p1, "notification"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .prologue
    .line 447
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->isSelfComment(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 448
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationType()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->contains(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 449
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getPayloadObjectForSharedPref(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)Lorg/json/JSONObject;

    move-result-object v0

    .line 450
    .local v0, "payload":Lorg/json/JSONObject;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationType()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->insertCommentOrInviteAccept(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z

    .line 453
    .end local v0    # "payload":Lorg/json/JSONObject;
    :cond_2b
    return-void
.end method

.method private insertNewInviteIntoSharedPref(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V
    .registers 7
    .param p1, "invite"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .prologue
    .line 428
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 429
    .local v1, "payLoadObj":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getInviteID()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->contains(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z

    move-result v2

    if-nez v2, :cond_46

    .line 431
    :try_start_13
    const-string v2, "state"

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 432
    const-string v2, "senderName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getSenderUserName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 433
    const-string v2, "folderName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getResourceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 434
    const-string v2, "acceptRequest"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getInviteID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_39
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_39} :catch_47

    .line 438
    :goto_39
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getInviteID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->insertInvite(Ljava/lang/String;Ljava/lang/String;)Z

    .line 440
    :cond_46
    return-void

    .line 435
    :catch_47
    move-exception v0

    .line 436
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_39
.end method

.method private isSelfComment(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)Z
    .registers 5
    .param p1, "notification"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .prologue
    const/4 v0, 0x0

    .line 412
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationType()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-ne v1, v2, :cond_1e

    .line 413
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getSelfAdobeID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1e

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getSelfAdobeID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getAdobeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 414
    const/4 v0, 0x1

    .line 418
    :cond_1e
    return v0
.end method

.method private removeActivityFromSharedPref(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V
    .registers 4
    .param p1, "notificationID"    # Ljava/lang/String;
    .param p2, "subType"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .prologue
    .line 498
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->deleteCommentOrInviteAccept(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z

    .line 499
    return-void
.end method


# virtual methods
.method public clearActivitiesList()V
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    if-eqz v0, :cond_9

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 58
    :cond_9
    return-void
.end method

.method public clearInvitationList()V
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    if-eqz v0, :cond_9

    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 53
    :cond_9
    return-void
.end method

.method public getActivitiesList()Ljava/util/ArrayList;
    .registers 7
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
    .line 270
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .local v0, "activities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .line 272
    .local v1, "activity":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getCurrentTime()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->recalculateTimeStampMessage(J)V

    .line 273
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 275
    .end local v1    # "activity":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    :cond_26
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$NotificationComparator;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$NotificationComparator;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 276
    return-object v0
.end method

.method public getAssetCommentCount(Ljava/lang/String;)I
    .registers 4
    .param p1, "assetHref"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 42
    if-nez p1, :cond_4

    .line 47
    :cond_3
    :goto_3
    return v0

    .line 44
    :cond_4
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_3
.end method

.method public getInvitationList()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;",
            ">;"
        }
    .end annotation

    .prologue
    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .local v0, "invitations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .line 264
    .local v1, "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 266
    .end local v1    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    :cond_1f
    return-object v0
.end method

.method public getInvitationListSize()I
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public markNotificationsForAssetsAsRead(Ljava/lang/String;Z)I
    .registers 8
    .param p1, "assetGuid"    # Ljava/lang/String;
    .param p2, "updateSharedPref"    # Z

    .prologue
    .line 161
    const/4 v0, 0x0

    .line 162
    .local v0, "count":I
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 163
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 164
    .local v2, "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 165
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->getPushNotificationQueue()Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->putNotificationInQueue(Ljava/util/ArrayList;)V

    .line 167
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    if-eqz p2, :cond_3c

    .line 169
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_24
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_3c

    .line 170
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationID()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-direct {p0, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->removeActivityFromSharedPref(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V

    .line 169
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 173
    .end local v1    # "i":I
    .end local v2    # "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    :cond_3c
    return v0
.end method

.method public populateActivitiesList(Lorg/json/JSONArray;)Landroid/util/Pair;
    .registers 26
    .param p1, "notificationsList"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    const-wide/16 v8, 0x0

    .line 185
    .local v8, "lastTimeStamp":J
    const/4 v4, 0x0

    .line 188
    .local v4, "activitiesCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v7, v0, :cond_1cf

    .line 190
    :try_start_c
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 191
    .local v10, "notification":Lorg/json/JSONObject;
    const-string v20, "type"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 192
    .local v19, "type":Ljava/lang/String;
    const-string v20, "com.adobe.stormcloud.v1"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_8e

    .line 193
    const-string v20, "timestamp"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 194
    const-string v20, "sub-type"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->getValue(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-result-object v16

    .line 195
    .local v16, "subtype":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_92

    .line 196
    add-int/lit8 v4, v4, 0x1

    .line 197
    const-string v20, "payload"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 198
    .local v17, "tempPayload":Ljava/lang/String;
    new-instance v13, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 199
    .local v13, "payload":Lorg/json/JSONObject;
    const-string v20, "notification-id"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 200
    .local v11, "notificationID":Ljava/lang/String;
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getInvitationNotification(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;

    move-result-object v14

    .line 201
    .local v14, "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setNotificationType(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V

    .line 202
    invoke-virtual {v14, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setTimestamp(J)V

    .line 203
    invoke-virtual {v14, v11}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setNotificationID(Ljava/lang/String;)V

    .line 204
    const-string v20, "state"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->getValue(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-result-object v15

    .line 205
    .local v15, "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getCurrentTime()J

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-virtual {v14, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->recalculateTimeStampMessage(J)V

    .line 206
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setLocalState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 207
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setServerState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v11, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .end local v10    # "notification":Lorg/json/JSONObject;
    .end local v11    # "notificationID":Ljava/lang/String;
    .end local v13    # "payload":Lorg/json/JSONObject;
    .end local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    .end local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .end local v16    # "subtype":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .end local v17    # "tempPayload":Ljava/lang/String;
    .end local v19    # "type":Ljava/lang/String;
    :cond_8e
    :goto_8e
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_4

    .line 209
    .restart local v10    # "notification":Lorg/json/JSONObject;
    .restart local v16    # "subtype":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .restart local v19    # "type":Ljava/lang/String;
    :cond_92
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_175

    .line 210
    add-int/lit8 v4, v4, 0x1

    .line 211
    const-string v20, "payload"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 212
    .restart local v17    # "tempPayload":Ljava/lang/String;
    new-instance v13, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 213
    .restart local v13    # "payload":Lorg/json/JSONObject;
    const-string v20, "notification-id"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 214
    .restart local v11    # "notificationID":Ljava/lang/String;
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getCommentNotification(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;

    move-result-object v14

    .line 215
    .restart local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setNotificationType(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V

    .line 216
    invoke-virtual {v14, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setTimestamp(J)V

    .line 217
    invoke-virtual {v14, v11}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setNotificationID(Ljava/lang/String;)V

    .line 218
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getCurrentTime()J

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-virtual {v14, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->recalculateTimeStampMessage(J)V

    .line 219
    const-string v20, "state"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->getValue(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-result-object v15

    .line 220
    .restart local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    if-eqz v15, :cond_166

    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-object/from16 v0, v20

    if-ne v15, v0, :cond_166

    .line 221
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setLocalState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 222
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setServerState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 223
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getRegion()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getResourceURL()Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getResourceURL()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x2f

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v22

    add-int/lit8 v22, v22, 0x1

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 224
    .local v6, "guidFromURL":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_152

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/ArrayList;

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    .end local v6    # "guidFromURL":Ljava/lang/String;
    :goto_13f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v11, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14a
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_14a} :catch_14c

    goto/16 :goto_8e

    .line 252
    .end local v10    # "notification":Lorg/json/JSONObject;
    .end local v11    # "notificationID":Ljava/lang/String;
    .end local v13    # "payload":Lorg/json/JSONObject;
    .end local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    .end local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .end local v16    # "subtype":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .end local v17    # "tempPayload":Ljava/lang/String;
    .end local v19    # "type":Ljava/lang/String;
    :catch_14c
    move-exception v5

    .line 253
    .local v5, "exp":Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_8e

    .line 227
    .end local v5    # "exp":Lorg/json/JSONException;
    .restart local v6    # "guidFromURL":Ljava/lang/String;
    .restart local v10    # "notification":Lorg/json/JSONObject;
    .restart local v11    # "notificationID":Ljava/lang/String;
    .restart local v13    # "payload":Lorg/json/JSONObject;
    .restart local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    .restart local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .restart local v16    # "subtype":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .restart local v17    # "tempPayload":Ljava/lang/String;
    .restart local v19    # "type":Ljava/lang/String;
    :cond_152
    :try_start_152
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v12, "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_assetCommentsCount:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13f

    .line 232
    .end local v6    # "guidFromURL":Ljava/lang/String;
    .end local v12    # "notifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    :cond_166
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setLocalState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 233
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setServerState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    goto :goto_13f

    .line 236
    .end local v11    # "notificationID":Ljava/lang/String;
    .end local v13    # "payload":Lorg/json/JSONObject;
    .end local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    .end local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .end local v17    # "tempPayload":Ljava/lang/String;
    :cond_175
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_8e

    .line 237
    add-int/lit8 v4, v4, 0x1

    .line 238
    const-string v20, "payload"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 239
    .restart local v17    # "tempPayload":Ljava/lang/String;
    new-instance v13, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 240
    .restart local v13    # "payload":Lorg/json/JSONObject;
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getInvitationNotification(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeInvitationAcceptPushNotification;

    move-result-object v14

    .line 241
    .restart local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    const-string v20, "notification-id"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 242
    .restart local v11    # "notificationID":Ljava/lang/String;
    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setNotificationType(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V

    .line 243
    invoke-virtual {v14, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setTimestamp(J)V

    .line 244
    invoke-virtual {v14, v11}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setNotificationID(Ljava/lang/String;)V

    .line 245
    const-string v20, "state"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->getValue(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-result-object v15

    .line 246
    .restart local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getCurrentTime()J

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-virtual {v14, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->recalculateTimeStampMessage(J)V

    .line 247
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setServerState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 248
    invoke-virtual {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setLocalState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_activitiesList:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v11, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1cd
    .catch Lorg/json/JSONException; {:try_start_152 .. :try_end_1cd} :catch_14c

    goto/16 :goto_8e

    .line 256
    .end local v10    # "notification":Lorg/json/JSONObject;
    .end local v11    # "notificationID":Ljava/lang/String;
    .end local v13    # "payload":Lorg/json/JSONObject;
    .end local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    .end local v15    # "state":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .end local v16    # "subtype":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .end local v17    # "tempPayload":Ljava/lang/String;
    .end local v19    # "type":Ljava/lang/String;
    :cond_1cf
    new-instance v18, Landroid/util/Pair;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 257
    .local v18, "timestampAndCount":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    return-object v18
.end method

.method public populateSharedPref(I)V
    .registers 8
    .param p1, "unreadCount"    # I

    .prologue
    .line 392
    sget-boolean v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->populateSharedPreferences:Z

    if-eqz v4, :cond_60

    .line 393
    const/4 v4, 0x0

    sput-boolean v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->populateSharedPreferences:Z

    .line 394
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->clearSharedPreferences()V

    .line 395
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getInvitationList()Ljava/util/ArrayList;

    move-result-object v1

    .line 396
    .local v1, "collaborationInvites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_23

    .line 397
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    invoke-direct {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->insertNewInviteIntoSharedPref(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V

    .line 396
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 399
    :cond_23
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int v0, p1, v4

    .line 400
    .local v0, "activityCounts":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getActivitiesList()Ljava/util/ArrayList;

    move-result-object v3

    .line 401
    .local v3, "pushNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v0, v4, :cond_37

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 402
    :cond_37
    const/4 v2, 0x0

    :goto_38
    if-ge v2, v0, :cond_60

    .line 403
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getLocalState()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    if-ne v4, v5, :cond_5d

    .line 404
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    invoke-direct {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->isSelfComment(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)Z

    move-result v4

    if-nez v4, :cond_5d

    .line 405
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    invoke-direct {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->insertNewActivityIntoSharedPref(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)V

    .line 402
    :cond_5d
    add-int/lit8 v2, v2, 0x1

    goto :goto_38

    .line 409
    .end local v0    # "activityCounts":I
    .end local v1    # "collaborationInvites":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    .end local v2    # "i":I
    .end local v3    # "pushNotifications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    :cond_60
    return-void
.end method

.method public setInvitations(Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "invitations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1d

    .line 178
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->_invitationList:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getInviteID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 180
    :cond_1d
    return-void
.end method
