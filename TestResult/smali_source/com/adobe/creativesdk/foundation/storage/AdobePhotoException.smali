.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
.source "AdobePhotoException.java"


# instance fields
.field private final description:Ljava/lang/String;

.field private final errorCode:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;)V
    .registers 3
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, p1, v0, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V
    .registers 5
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;
    .param p3, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "cause"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p2, p4}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;-><init>(Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 45
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->errorCode:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    .line 46
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->description:Ljava/lang/String;

    .line 47
    return-void
.end method
