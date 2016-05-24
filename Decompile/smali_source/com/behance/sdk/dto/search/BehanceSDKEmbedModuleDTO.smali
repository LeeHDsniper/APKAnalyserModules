.class public Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;
.super Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
.source "BehanceSDKEmbedModuleDTO.java"


# static fields
.field private static final serialVersionUID:J = 0x7291216e59c482c0L


# instance fields
.field private embedHTML:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;-><init>()V

    .line 35
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->EMBED:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;->setType(Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;)V

    .line 36
    return-void
.end method


# virtual methods
.method public setEmbedHTML(Ljava/lang/String;)V
    .registers 2
    .param p1, "embedHTML"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;->embedHTML:Ljava/lang/String;

    .line 43
    return-void
.end method
