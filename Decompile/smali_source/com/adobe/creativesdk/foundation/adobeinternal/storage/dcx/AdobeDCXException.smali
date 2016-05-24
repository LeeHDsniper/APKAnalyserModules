.class public Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
.source "AdobeDCXException.java"


# instance fields
.field private final _description:Ljava/lang/String;

.field private final _errorCode:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;
    .param p2, "description"    # Ljava/lang/String;
    .param p4, "cause"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p3, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;-><init>(Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 40
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;->_errorCode:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;

    .line 41
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;->_description:Ljava/lang/String;

    .line 42
    return-void
.end method
