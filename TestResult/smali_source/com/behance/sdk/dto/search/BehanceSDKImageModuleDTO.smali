.class public Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;
.super Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
.source "BehanceSDKImageModuleDTO.java"


# static fields
.field private static final serialVersionUID:J = -0x52a47cc66e96cbb0L


# instance fields
.field private fullBleed:Z

.field private hdSrcUrl:Ljava/lang/String;

.field private height:I

.field private srcUrl:Ljava/lang/String;

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;-><init>()V

    .line 38
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->IMAGE:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setType(Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;)V

    .line 39
    return-void
.end method


# virtual methods
.method public setFullBleed(Z)V
    .registers 2
    .param p1, "fullBleed"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->fullBleed:Z

    .line 87
    return-void
.end method

.method public setHDSrcUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "originalSizeUrl"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->hdSrcUrl:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->height:I

    .line 67
    return-void
.end method

.method public setSrcUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "srcUrl"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->srcUrl:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setWidth(I)V
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 58
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->width:I

    .line 59
    return-void
.end method
