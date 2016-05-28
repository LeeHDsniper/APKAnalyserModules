.class public Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;
.super Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
.source "BehanceSDKAudioModuleDTO.java"


# static fields
.field private static final serialVersionUID:J = -0x8f7b58ea4cbfc1cL


# instance fields
.field private embedHTML:Ljava/lang/String;

.field private srcURL:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;-><init>()V

    .line 37
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->AUDIO:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;->setType(Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;)V

    .line 38
    return-void
.end method


# virtual methods
.method public setEmbedHTML(Ljava/lang/String;)V
    .registers 2
    .param p1, "embedHTML"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;->embedHTML:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setSrcURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "srcURL"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;->srcURL:Ljava/lang/String;

    .line 54
    return-void
.end method
