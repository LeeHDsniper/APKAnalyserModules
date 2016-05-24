.class public Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
.super Ljava/lang/Object;
.source "BehanceSDKProjectDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x712b811c6bd0522cL


# instance fields
.field private appreciatedByUser:Z

.field private appreciatedByUserOn:J

.field private copyright:Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;

.field private covers:Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;

.field private createdDate:J

.field private custom_css:Ljava/lang/String;

.field private description:Ljava/lang/String;

.field private features:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;",
            ">;"
        }
    .end annotation
.end field

.field private fields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private html:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private isVisible:Z

.field private layoutHTMLPath:Ljava/lang/String;

.field private matureAccess:Ljava/lang/String;

.field private matureContent:Z

.field private modifiedDate:J

.field private modules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private owners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;",
            ">;"
        }
    .end annotation
.end field

.field private privacy:Ljava/lang/String;

.field private projectUrl:Ljava/lang/String;

.field private publicProject:Z

.field private publishedDate:J

.field private shortUrl:Ljava/lang/String;

.field private stats:Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;

.field private tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->isVisible:Z

    return-void
.end method


# virtual methods
.method public addFeature(Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;)V
    .registers 3
    .param p1, "feature"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;

    .prologue
    .line 300
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->features:Ljava/util/List;

    if-nez v0, :cond_b

    .line 301
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->features:Ljava/util/List;

    .line 303
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    return-void
.end method

.method public addModule(Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;)V
    .registers 3
    .param p1, "module"    # Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->modules:Ljava/util/List;

    if-nez v0, :cond_b

    .line 230
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->modules:Ljava/util/List;

    .line 232
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->modules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    return-void
.end method

.method public addOwner(Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;)V
    .registers 3
    .param p1, "owner"    # Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->owners:Ljava/util/List;

    if-nez v0, :cond_b

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->owners:Ljava/util/List;

    .line 112
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->owners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    return-void
.end method

.method public addTag(Ljava/lang/String;)V
    .registers 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 318
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->tags:Ljava/util/List;

    if-nez v0, :cond_b

    .line 319
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->tags:Ljava/util/List;

    .line 321
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->tags:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    return-void
.end method

.method public setCopyright(Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;)V
    .registers 2
    .param p1, "copyright"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;

    .prologue
    .line 332
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->copyright:Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;

    .line 333
    return-void
.end method

.method public setCovers(Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;)V
    .registers 2
    .param p1, "covers"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->covers:Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;

    .line 214
    return-void
.end method

.method public setCreatedDate(J)V
    .registers 4
    .param p1, "createdDate"    # J

    .prologue
    .line 175
    iput-wide p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->createdDate:J

    .line 176
    return-void
.end method

.method public setCustomCSS(Ljava/lang/String;)V
    .registers 2
    .param p1, "custom_css"    # Ljava/lang/String;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->custom_css:Ljava/lang/String;

    .line 249
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 240
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->description:Ljava/lang/String;

    .line 241
    return-void
.end method

.method public setFields(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->fields:Ljava/util/List;

    .line 125
    return-void
.end method

.method public setHTML(Ljava/lang/String;)V
    .registers 2
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 256
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->html:Ljava/lang/String;

    .line 257
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->id:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setMatureAccess(Ljava/lang/String;)V
    .registers 2
    .param p1, "matureAccess"    # Ljava/lang/String;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->matureAccess:Ljava/lang/String;

    .line 168
    return-void
.end method

.method public setMatureContent(Z)V
    .registers 2
    .param p1, "matureContent"    # Z

    .prologue
    .line 156
    iput-boolean p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->matureContent:Z

    .line 157
    return-void
.end method

.method public setModifiedDate(J)V
    .registers 4
    .param p1, "modifiedDate"    # J

    .prologue
    .line 183
    iput-wide p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->modifiedDate:J

    .line 184
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->name:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setPrivacy(Ljava/lang/String;)V
    .registers 3
    .param p1, "privacy"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->privacy:Ljava/lang/String;

    .line 148
    const-string v0, "public"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setPublicProject(Z)V

    .line 149
    return-void
.end method

.method public setPublicProject(Z)V
    .registers 2
    .param p1, "publicProject"    # Z

    .prologue
    .line 284
    iput-boolean p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->publicProject:Z

    .line 285
    return-void
.end method

.method public setPublishedDate(J)V
    .registers 4
    .param p1, "publishedDate"    # J

    .prologue
    .line 191
    iput-wide p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->publishedDate:J

    .line 192
    return-void
.end method

.method public setShortUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "shortUrl"    # Ljava/lang/String;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->shortUrl:Ljava/lang/String;

    .line 273
    return-void
.end method

.method public setStats(Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;)V
    .registers 2
    .param p1, "stats"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->stats:Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;

    .line 203
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectUrl"    # Ljava/lang/String;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->projectUrl:Ljava/lang/String;

    .line 140
    return-void
.end method
