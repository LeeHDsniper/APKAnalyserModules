.class public Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;
.super Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
.source "BehanceSDKVideoModuleDTO.java"


# static fields
.field private static final serialVersionUID:J = 0x36af8012d1b059cfL


# instance fields
.field private embedHTML:Ljava/lang/String;

.field private height:I

.field private imageSrc:Ljava/lang/String;

.field private playerSkin:Ljava/lang/String;

.field private playerUrl:Ljava/lang/String;

.field private videoSrc:Ljava/lang/String;

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;-><init>()V

    .line 42
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->VIDEO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setType(Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;)V

    .line 43
    return-void
.end method


# virtual methods
.method public setEmbedHTML(Ljava/lang/String;)V
    .registers 2
    .param p1, "embedHTML"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->embedHTML:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->height:I

    .line 51
    return-void
.end method

.method public setImageSrc(Ljava/lang/String;)V
    .registers 2
    .param p1, "imageSrc"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->imageSrc:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setPlayerSkin(Ljava/lang/String;)V
    .registers 2
    .param p1, "playerSkin"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->playerSkin:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public setPlayerUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "playerUrl"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->playerUrl:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setVideoSrc(Ljava/lang/String;)V
    .registers 2
    .param p1, "videoSrc"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->videoSrc:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setWidth(I)V
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 58
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->width:I

    .line 59
    return-void
.end method
