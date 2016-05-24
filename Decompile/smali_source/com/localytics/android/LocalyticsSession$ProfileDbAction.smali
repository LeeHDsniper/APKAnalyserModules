.class final enum Lcom/localytics/android/LocalyticsSession$ProfileDbAction;
.super Ljava/lang/Enum;
.source "LocalyticsSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/LocalyticsSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ProfileDbAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/localytics/android/LocalyticsSession$ProfileDbAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

.field public static final enum SET_ATTRIBUTE:Lcom/localytics/android/LocalyticsSession$ProfileDbAction;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 138
    new-instance v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    const-string v1, "SET_ATTRIBUTE"

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->SET_ATTRIBUTE:Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    sget-object v1, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->SET_ATTRIBUTE:Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    aput-object v1, v0, v2

    sput-object v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->$VALUES:[Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

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
    .line 138
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/localytics/android/LocalyticsSession$ProfileDbAction;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 138
    const-class v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    return-object v0
.end method

.method public static values()[Lcom/localytics/android/LocalyticsSession$ProfileDbAction;
    .registers 1

    .prologue
    .line 138
    sget-object v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->$VALUES:[Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    invoke-virtual {v0}, [Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    return-object v0
.end method
