.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
.source "AdobeAssetLibrary.java"


# instance fields
.field private brushes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;",
            ">;"
        }
    .end annotation
.end field

.field private characterStyles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;",
            ">;"
        }
    .end annotation
.end field

.field private colorThemes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;",
            ">;"
        }
    .end annotation
.end field

.field private colors:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;",
            ">;"
        }
    .end annotation
.end field

.field private images:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;",
            ">;"
        }
    .end annotation
.end field

.field private layoutStyles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;",
            ">;"
        }
    .end annotation
.end field

.field private looks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;-><init>()V

    .line 129
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->initcommon()V

    .line 130
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 3
    .param p1, "asrc"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 134
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 135
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->initcommon()V

    .line 136
    return-void
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->brushes:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyles:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colors:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemes:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->layoutStyles:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$502(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->images:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$602(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->looks:Ljava/util/HashMap;

    return-object p1
.end method

.method private initcommon()V
    .registers 2

    .prologue
    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->brushes:Ljava/util/HashMap;

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyles:Ljava/util/HashMap;

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colors:Ljava/util/HashMap;

    .line 122
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemes:Ljava/util/HashMap;

    .line 123
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->layoutStyles:Ljava/util/HashMap;

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->images:Ljava/util/HashMap;

    .line 125
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->looks:Ljava/util/HashMap;

    .line 126
    return-void
.end method


# virtual methods
.method characterStyleNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .registers 7
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 479
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getChildrenOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 480
    .local v1, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 482
    .local v0, "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "application/vnd.adobe.characterstyle+json"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 488
    .end local v0    # "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    :goto_2a
    return-object v0

    :cond_2b
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method colorNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .registers 7
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 428
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getChildrenOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 429
    .local v1, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 431
    .local v0, "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "application/vnd.adobe.color+json"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 437
    .end local v0    # "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    :goto_2a
    return-object v0

    :cond_2b
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method colorRenditionNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .registers 7
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 443
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getChildrenOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 444
    .local v1, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 447
    .local v0, "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    const-string v3, "library#rel"

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c

    const-string v3, "library#rel"

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "rendition"

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 453
    .end local v0    # "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    :goto_2e
    return-object v0

    :cond_2f
    const/4 v0, 0x0

    goto :goto_2e
.end method

.method colorThemeNodeForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .registers 7
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 462
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getChildrenOf(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 463
    .local v1, "children":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .line 465
    .local v0, "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "application/vnd.adobe.colortheme+json"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 471
    .end local v0    # "child":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    :goto_2a
    return-object v0

    :cond_2b
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method public count()I
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 528
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colors:Ljava/util/HashMap;

    if-eqz v1, :cond_4f

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colors:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    :goto_b
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemes:Ljava/util/HashMap;

    if-eqz v3, :cond_51

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemes:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    :goto_15
    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->images:Ljava/util/HashMap;

    if-eqz v1, :cond_53

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->images:Ljava/util/HashMap;

    .line 529
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    :goto_20
    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyles:Ljava/util/HashMap;

    if-eqz v1, :cond_55

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyles:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    :goto_2b
    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->brushes:Ljava/util/HashMap;

    if-eqz v1, :cond_57

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->brushes:Ljava/util/HashMap;

    .line 530
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    :goto_36
    add-int/2addr v3, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->layoutStyles:Ljava/util/HashMap;

    if-eqz v1, :cond_59

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->layoutStyles:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    :goto_41
    add-int/2addr v1, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->looks:Ljava/util/HashMap;

    if-eqz v3, :cond_4c

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->looks:Ljava/util/HashMap;

    .line 531
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    :cond_4c
    add-int v0, v1, v2

    .line 533
    .local v0, "countAll":I
    return v0

    .end local v0    # "countAll":I
    :cond_4f
    move v1, v2

    .line 528
    goto :goto_b

    :cond_51
    move v3, v2

    goto :goto_15

    :cond_53
    move v1, v2

    .line 529
    goto :goto_20

    :cond_55
    move v1, v2

    goto :goto_2b

    :cond_57
    move v1, v2

    .line 530
    goto :goto_36

    :cond_59
    move v1, v2

    goto :goto_41
.end method

.method public getBrushes()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->brushes:Ljava/util/HashMap;

    return-object v0
.end method

.method public getCharacterStyles()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->characterStyles:Ljava/util/HashMap;

    return-object v0
.end method

.method public getColorThemes()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colorThemes:Ljava/util/HashMap;

    return-object v0
.end method

.method public getColors()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->colors:Ljava/util/HashMap;

    return-object v0
.end method

.method public getImages()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->images:Ljava/util/HashMap;

    return-object v0
.end method

.method public getLayoutStyles()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->layoutStyles:Ljava/util/HashMap;

    return-object v0
.end method

.method public getLooks()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->looks:Ljava/util/HashMap;

    return-object v0
.end method

.method public loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 6
    .param p1, "successCallback"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 141
    .local v2, "weakThis":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;>;"
    move-object v1, p0

    .line 143
    .local v1, "self":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;

    invoke-direct {v0, p0, v2, v1, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/lang/ref/WeakReference;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V

    .line 421
    .local v0, "callback":Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    invoke-super {p0, v0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 423
    return-void
.end method

.method primaryComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .registers 7
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 495
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getComponentsOfChild(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 496
    .local v1, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    .line 498
    .local v0, "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v3

    const-string v4, "primary"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 504
    .end local v0    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :goto_2a
    return-object v0

    :cond_2b
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method renditionComponentForNode(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .registers 7
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;

    .prologue
    .line 510
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getComponentsOfChild(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;)Ljava/util/ArrayList;

    move-result-object v1

    .line 511
    .local v1, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;

    .line 513
    .local v0, "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getRelationship()Ljava/lang/String;

    move-result-object v3

    const-string v4, "rendition"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 514
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "image/png"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_48

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "image/jpg"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 520
    .end local v0    # "component":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    :cond_48
    :goto_48
    return-object v0

    :cond_49
    const/4 v0, 0x0

    goto :goto_48
.end method
