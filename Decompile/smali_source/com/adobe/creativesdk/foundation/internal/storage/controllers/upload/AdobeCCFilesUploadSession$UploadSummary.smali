.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;
.super Ljava/lang/Object;
.source "AdobeCCFilesUploadSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UploadSummary"
.end annotation


# instance fields
.field public _cancelledAssets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            ">;"
        }
    .end annotation
.end field

.field public _errorAssets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            ">;"
        }
    .end annotation
.end field

.field public _successAssets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;->_errorAssets:Ljava/util/ArrayList;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;->_successAssets:Ljava/util/ArrayList;

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;->_cancelledAssets:Ljava/util/ArrayList;

    .line 67
    return-void
.end method


# virtual methods
.method public getErrorCount()I
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;->_errorAssets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getSuccessCount()I
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;->_successAssets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
