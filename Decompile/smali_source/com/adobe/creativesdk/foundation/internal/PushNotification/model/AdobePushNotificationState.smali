.class public final enum Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
.super Ljava/lang/Enum;
.source "AdobePushNotificationState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

.field public static final enum ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

.field public static final enum ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    const-string v1, "ADOBE_PUSH_NOTIFICATION_STATE_NEW"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    const-string v1, "ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .line 6
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    return-void
.end method

.method public static getValue(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .registers 3
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 21
    if-nez p0, :cond_4

    .line 27
    :cond_3
    :goto_3
    return-object v0

    .line 23
    :cond_4
    const-string v1, "NEW"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 24
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    goto :goto_3

    .line 25
    :cond_f
    const-string v1, "EXPIRED"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 26
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    goto :goto_3
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 11
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationState:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 17
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 13
    :pswitch_d
    const-string v0, "NEW"

    goto :goto_c

    .line 15
    :pswitch_10
    const-string v0, "EXPIRED"

    goto :goto_c

    .line 11
    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_d
        :pswitch_10
    .end packed-switch
.end method
