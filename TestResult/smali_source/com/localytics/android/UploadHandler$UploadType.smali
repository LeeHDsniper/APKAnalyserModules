.class final enum Lcom/localytics/android/UploadHandler$UploadType;
.super Ljava/lang/Enum;
.source "UploadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/UploadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "UploadType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/localytics/android/UploadHandler$UploadType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/localytics/android/UploadHandler$UploadType;

.field public static final enum PROFILES:Lcom/localytics/android/UploadHandler$UploadType;

.field public static final enum SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 366
    new-instance v0, Lcom/localytics/android/UploadHandler$UploadType;

    const-string v1, "SESSIONS"

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/UploadHandler$UploadType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    new-instance v0, Lcom/localytics/android/UploadHandler$UploadType;

    const-string v1, "PROFILES"

    invoke-direct {v0, v1, v3}, Lcom/localytics/android/UploadHandler$UploadType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/localytics/android/UploadHandler$UploadType;->PROFILES:Lcom/localytics/android/UploadHandler$UploadType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/localytics/android/UploadHandler$UploadType;

    sget-object v1, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/localytics/android/UploadHandler$UploadType;->PROFILES:Lcom/localytics/android/UploadHandler$UploadType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/UploadHandler$UploadType;->$VALUES:[Lcom/localytics/android/UploadHandler$UploadType;

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
    .line 366
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/localytics/android/UploadHandler$UploadType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 366
    const-class v0, Lcom/localytics/android/UploadHandler$UploadType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/UploadHandler$UploadType;

    return-object v0
.end method

.method public static values()[Lcom/localytics/android/UploadHandler$UploadType;
    .registers 1

    .prologue
    .line 366
    sget-object v0, Lcom/localytics/android/UploadHandler$UploadType;->$VALUES:[Lcom/localytics/android/UploadHandler$UploadType;

    invoke-virtual {v0}, [Lcom/localytics/android/UploadHandler$UploadType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/localytics/android/UploadHandler$UploadType;

    return-object v0
.end method
