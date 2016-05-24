.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;
.super Ljava/lang/Exception;
.source "ParsingDataException.java"


# instance fields
.field private _error:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;->_error:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .line 11
    return-void
.end method


# virtual methods
.method public getError()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .registers 2

    .prologue
    .line 15
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;->_error:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    return-object v0
.end method
