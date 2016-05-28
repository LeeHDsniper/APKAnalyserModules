.class Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;
.super Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
.source "NativeProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/NativeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KatanaAppInfo"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;-><init>(Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;)V
    .registers 2

    .prologue
    .line 249
    invoke-direct {p0}, Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPackage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 254
    const-string v0, "com.facebook.katana"

    return-object v0
.end method
