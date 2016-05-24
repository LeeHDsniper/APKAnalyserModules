.class synthetic Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 963
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode:[I

    :try_start_9
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkReachableViaWiFi:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_9c

    :goto_14
    :try_start_14
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkReachableViaMobileData:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_9a

    :goto_1f
    :try_start_1f
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkNotReachable:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_98

    .line 354
    :goto_2a
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->values()[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    :try_start_33
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_96

    :goto_3e
    :try_start_3e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_49
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_49} :catch_94

    :goto_49
    :try_start_49
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_54
    .catch Ljava/lang/NoSuchFieldError; {:try_start_49 .. :try_end_54} :catch_92

    :goto_54
    :try_start_54
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_5f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_54 .. :try_end_5f} :catch_90

    .line 194
    :goto_5f
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType:[I

    :try_start_68
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_73
    .catch Ljava/lang/NoSuchFieldError; {:try_start_68 .. :try_end_73} :catch_8e

    :goto_73
    :try_start_73
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_7e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_73 .. :try_end_7e} :catch_8c

    :goto_7e
    :try_start_7e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFileRenditionType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_89
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7e .. :try_end_89} :catch_8a

    :goto_89
    return-void

    :catch_8a
    move-exception v0

    goto :goto_89

    :catch_8c
    move-exception v0

    goto :goto_7e

    :catch_8e
    move-exception v0

    goto :goto_73

    .line 354
    :catch_90
    move-exception v0

    goto :goto_5f

    :catch_92
    move-exception v0

    goto :goto_54

    :catch_94
    move-exception v0

    goto :goto_49

    :catch_96
    move-exception v0

    goto :goto_3e

    .line 963
    :catch_98
    move-exception v0

    goto :goto_2a

    :catch_9a
    move-exception v0

    goto :goto_1f

    :catch_9c
    move-exception v0

    goto/16 :goto_14
.end method
