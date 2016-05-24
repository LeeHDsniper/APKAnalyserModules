.class synthetic Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/services/BehanceSDKPublishWIPService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 633
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->values()[Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    :try_start_9
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_8d

    :goto_14
    :try_start_14
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_8b

    :goto_1f
    :try_start_1f
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_89

    :goto_2a
    :try_start_2a
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_87

    :goto_35
    :try_start_35
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_85

    :goto_40
    :try_start_40
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_83

    :goto_4b
    :try_start_4b
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_81

    :goto_56
    :try_start_56
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_56 .. :try_end_62} :catch_7f

    :goto_62
    :try_start_62
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_6e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_62 .. :try_end_6e} :catch_7d

    :goto_6e
    :try_start_6e
    sget-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6e .. :try_end_7a} :catch_7b

    :goto_7a
    return-void

    :catch_7b
    move-exception v0

    goto :goto_7a

    :catch_7d
    move-exception v0

    goto :goto_6e

    :catch_7f
    move-exception v0

    goto :goto_62

    :catch_81
    move-exception v0

    goto :goto_56

    :catch_83
    move-exception v0

    goto :goto_4b

    :catch_85
    move-exception v0

    goto :goto_40

    :catch_87
    move-exception v0

    goto :goto_35

    :catch_89
    move-exception v0

    goto :goto_2a

    :catch_8b
    move-exception v0

    goto :goto_1f

    :catch_8d
    move-exception v0

    goto :goto_14
.end method
