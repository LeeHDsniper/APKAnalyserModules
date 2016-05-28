.class public final enum Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
.super Ljava/lang/Enum;
.source "AdobePushNotificationSubType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

.field public static final enum ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

.field public static final enum ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

.field public static final enum ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

.field public static final enum ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    const-string v1, "ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    const-string v1, "ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    const-string v1, "ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .line 12
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    const-string v1, "ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .line 6
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

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

    .line 23
    return-void
.end method

.method public static getValue(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .registers 3
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 29
    if-nez p0, :cond_4

    .line 39
    :cond_3
    :goto_3
    return-object v0

    .line 31
    :cond_4
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 32
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    goto :goto_3

    .line 33
    :cond_13
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 34
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_RECIEVED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    goto :goto_3

    .line 35
    :cond_22
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 36
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_SELF:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    goto :goto_3

    .line 37
    :cond_31
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 38
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_INVITATION_ACCEPTED_OTHER:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    goto :goto_3
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 15
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$PushNotification$model$AdobePushNotificationSubType:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1a

    .line 25
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 17
    :pswitch_d
    const-string v0, "notification.asset.comment"

    goto :goto_c

    .line 19
    :pswitch_10
    const-string v0, "sharing.invite"

    goto :goto_c

    .line 21
    :pswitch_13
    const-string v0, "sharing.invite.accept.other"

    goto :goto_c

    .line 23
    :pswitch_16
    const-string v0, "sharing.invite.accept.self"

    goto :goto_c

    .line 15
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_10
        :pswitch_13
        :pswitch_16
    .end packed-switch
.end method
