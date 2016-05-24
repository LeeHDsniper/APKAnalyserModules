.class public Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;
.super Ljava/lang/Object;
.source "AdobePushNotificationDataModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel$1;
    }
.end annotation


# static fields
.field public static ASSET_COUNT:Ljava/lang/String;

.field private static _dataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;


# instance fields
.field private mContext:Landroid/content/Context;

.field preference_file_comment_key:Ljava/lang/String;

.field preference_file_invite_accept_key:Ljava/lang/String;

.field preference_file_invite_key:Ljava/lang/String;

.field sharedCommentPref:Landroid/content/SharedPreferences;

.field sharedInviteAcceptPref:Landroid/content/SharedPreferences;

.field sharedInvitePref:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    const-string v0, "ASSET_COUNT"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string v0, "com.adobe.creativecloud.NotificationsInviteDatabase"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->preference_file_invite_key:Ljava/lang/String;

    .line 47
    const-string v0, "com.adobe.creativecloud.NotificationsInviteAcceptDatabase"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->preference_file_invite_accept_key:Ljava/lang/String;

    .line 48
    const-string v0, "com.adobe.creativecloud.NotificationsCommentDatabase"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->preference_file_comment_key:Ljava/lang/String;

    .line 56
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->mContext:Landroid/content/Context;

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->preference_file_invite_key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInvitePref:Landroid/content/SharedPreferences;

    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->preference_file_invite_accept_key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInviteAcceptPref:Landroid/content/SharedPreferences;

    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->preference_file_comment_key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedCommentPref:Landroid/content/SharedPreferences;

    .line 61
    return-void
.end method

.method public static declared-synchronized getSharedNotificationDataModel()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;
    .registers 2

    .prologue
    .line 66
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->_dataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    if-nez v0, :cond_e

    .line 67
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->_dataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;

    .line 69
    :cond_e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->_dataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

    .line 66
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getURLFromPayload(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Ljava/lang/String;
    .registers 6
    .param p1, "payload"    # Ljava/lang/String;
    .param p2, "subType"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .prologue
    .line 76
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "payloadJSON":Lorg/json/JSONObject;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-eq p2, v2, :cond_d

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-ne p2, v2, :cond_14

    .line 79
    :cond_d
    const-string v2, "folderUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 86
    .end local v1    # "payloadJSON":Lorg/json/JSONObject;
    :goto_13
    return-object v2

    .line 80
    .restart local v1    # "payloadJSON":Lorg/json/JSONObject;
    :cond_14
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {p2, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 81
    const-string v2, "assetUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_21} :catch_23

    move-result-object v2

    goto :goto_13

    .line 83
    .end local v1    # "payloadJSON":Lorg/json/JSONObject;
    :catch_23
    move-exception v0

    .line 84
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 86
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_27
    const/4 v2, 0x0

    goto :goto_13
.end method


# virtual methods
.method public clearSharedPreferences()V
    .registers 3

    .prologue
    .line 313
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedCommentPref:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 314
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 315
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 317
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInviteAcceptPref:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 318
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 319
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 321
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInvitePref:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 322
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 323
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 324
    return-void
.end method

.method public contains(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z
    .registers 7
    .param p1, "ID"    # Ljava/lang/String;
    .param p2, "subType"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 116
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3a

    move v0, v1

    .line 133
    :cond_e
    :goto_e
    return v0

    .line 119
    :pswitch_f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedCommentPref:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_1b

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedCommentPref:Landroid/content/SharedPreferences;

    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_e

    :cond_1b
    move v0, v1

    .line 121
    goto :goto_e

    .line 124
    :pswitch_1d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInviteAcceptPref:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_29

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInviteAcceptPref:Landroid/content/SharedPreferences;

    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_e

    :cond_29
    move v0, v1

    .line 126
    goto :goto_e

    .line 128
    :pswitch_2b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInvitePref:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_37

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInvitePref:Landroid/content/SharedPreferences;

    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_e

    :cond_37
    move v0, v1

    .line 130
    goto :goto_e

    .line 116
    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_f
        :pswitch_1d
        :pswitch_1d
        :pswitch_2b
    .end packed-switch
.end method

.method public deleteCommentOrInviteAccept(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z
    .registers 10
    .param p1, "notificationID"    # Ljava/lang/String;
    .param p2, "subType"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .prologue
    const/4 v6, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 180
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-ne p2, v5, :cond_30

    .line 181
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedCommentPref:Landroid/content/SharedPreferences;

    .line 188
    .local v2, "sharedPref":Landroid/content/SharedPreferences;
    :goto_9
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 189
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v2, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 190
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    invoke-interface {v2, v5, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 191
    .local v0, "asset_count":I
    invoke-interface {v2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    if-ne v5, v6, :cond_3b

    .line 192
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    invoke-interface {v1, v5, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 199
    :goto_28
    invoke-interface {v1, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 201
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move v3, v4

    .line 204
    .end local v0    # "asset_count":I
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "sharedPref":Landroid/content/SharedPreferences;
    :cond_2f
    return v3

    .line 182
    :cond_30
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-eq p2, v5, :cond_38

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-ne p2, v5, :cond_2f

    .line 184
    :cond_38
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInviteAcceptPref:Landroid/content/SharedPreferences;

    .restart local v2    # "sharedPref":Landroid/content/SharedPreferences;
    goto :goto_9

    .line 193
    .restart local v0    # "asset_count":I
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_3b
    if-ne v0, v4, :cond_4d

    invoke-interface {v2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-le v3, v6, :cond_4d

    .line 194
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_28

    .line 197
    :cond_4d
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    const/4 v5, 0x2

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_28
.end method

.method public insertCommentOrInviteAccept(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Z
    .registers 12
    .param p1, "notificationID"    # Ljava/lang/String;
    .param p2, "payload"    # Ljava/lang/String;
    .param p3, "subType"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 139
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-ne p3, v7, :cond_30

    .line 140
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedCommentPref:Landroid/content/SharedPreferences;

    .line 147
    .local v3, "sharedPref":Landroid/content/SharedPreferences;
    :goto_8
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 149
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v3, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2f

    .line 150
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    invoke-interface {v3, v7, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 152
    .local v0, "asset_count":I
    invoke-direct {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->getURLFromPayload(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "currentAssetURL":Ljava/lang/String;
    if-nez v0, :cond_3b

    .line 155
    const-string v5, "assetUrl"

    invoke-interface {v2, v5, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 156
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 169
    :cond_28
    :goto_28
    invoke-interface {v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 170
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move v5, v6

    .line 174
    .end local v0    # "asset_count":I
    .end local v1    # "currentAssetURL":Ljava/lang/String;
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v3    # "sharedPref":Landroid/content/SharedPreferences;
    :cond_2f
    return v5

    .line 141
    :cond_30
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-eq p3, v7, :cond_38

    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    if-ne p3, v7, :cond_2f

    .line 143
    :cond_38
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInviteAcceptPref:Landroid/content/SharedPreferences;

    .restart local v3    # "sharedPref":Landroid/content/SharedPreferences;
    goto :goto_8

    .line 158
    .restart local v0    # "asset_count":I
    .restart local v1    # "currentAssetURL":Ljava/lang/String;
    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_3b
    if-ne v0, v6, :cond_53

    .line 159
    const-string v5, "assetUrl"

    const/4 v7, 0x0

    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 160
    .local v4, "storedAssetURL":Ljava/lang/String;
    if-eqz v4, :cond_28

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_28

    .line 161
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    const/4 v7, 0x2

    invoke-interface {v2, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_28

    .line 166
    .end local v4    # "storedAssetURL":Ljava/lang/String;
    :cond_53
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->ASSET_COUNT:Ljava/lang/String;

    add-int/lit8 v7, v0, 0x1

    invoke-interface {v2, v5, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_28
.end method

.method public insertInvite(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "inviteID"    # Ljava/lang/String;
    .param p2, "payload"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInvitePref:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 92
    .local v0, "inviteEditor":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel;->sharedInvitePref:Landroid/content/SharedPreferences;

    invoke-interface {v1, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 94
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 95
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 96
    const/4 v1, 0x1

    .line 98
    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method
