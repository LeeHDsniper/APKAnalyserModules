.class public Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;
.super Ljava/lang/Object;
.source "AdobeCommonApplicationContextHolder.java"


# static fields
.field static _staticApplicationContextHolder:Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;


# instance fields
.field private _applicationContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_staticApplicationContextHolder:Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_applicationContext:Landroid/content/Context;

    .line 31
    return-void
.end method

.method public static getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_staticApplicationContextHolder:Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    if-nez v0, :cond_b

    .line 37
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_staticApplicationContextHolder:Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    .line 39
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_staticApplicationContextHolder:Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    return-object v0
.end method


# virtual methods
.method public getApplicationContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public setApplicationContext(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->_applicationContext:Landroid/content/Context;

    .line 50
    return-void
.end method
