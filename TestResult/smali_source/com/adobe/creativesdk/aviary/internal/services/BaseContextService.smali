.class public abstract Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.super Ljava/lang/Object;
.source "BaseContextService.java"


# static fields
.field protected static final HANDLER:Landroid/os/Handler;


# instance fields
.field protected logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

.field protected mDisposed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->HANDLER:Landroid/os/Handler;

    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 24
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 25
    return-void
.end method


# virtual methods
.method public abstract dispose()V
.end method

.method public getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    return-object v0
.end method

.method public getService(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    if-eqz v0, :cond_b

    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 35
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public internalDispose()V
    .registers 3

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "internalDispose"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 44
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->dispose()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mDisposed:Z

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 47
    return-void
.end method

.method public isActive()Z
    .registers 2

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;->mDisposed:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
