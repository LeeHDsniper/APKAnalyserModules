.class public Lcom/behance/sdk/project/NewBehanceProject;
.super Ljava/lang/Object;
.source "NewBehanceProject.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x102643615f51a544L


# instance fields
.field private containAdultContent:I

.field private copyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field private cover:Lcom/behance/sdk/project/modules/CoverImage;

.field private description:Ljava/lang/String;

.field private embedModuleCount:I

.field private fields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation
.end field

.field private projectID:Ljava/lang/String;

.field private projectModules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;"
        }
    .end annotation
.end field

.field private projectURL:Ljava/lang/String;

.field private shareOnFaceBook:Z

.field private shareOnTwitter:Z

.field private tags:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->embedModuleCount:I

    .line 60
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getDefaultValue()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->copyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 62
    iput v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->containAdultContent:I

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    .line 74
    return-void
.end method


# virtual methods
.method public addImagesToProject(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 263
    .local p1, "projectImageSelection":Ljava/util/List;, "Ljava/util/List<+Lcom/behance/sdk/project/modules/ImageModule;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 264
    .local v0, "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    iget-object v2, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 265
    invoke-virtual {p0, v0}, Lcom/behance/sdk/project/NewBehanceProject;->addProjectModule(Lcom/behance/sdk/project/modules/ProjectModule;)V

    goto :goto_4

    .line 267
    .end local v0    # "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_1c
    return-void
.end method

.method public addProjectModule(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 4
    .param p1, "module"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 181
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    invoke-interface {p1}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v0

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v0, v1, :cond_20

    .line 183
    check-cast p1, Lcom/behance/sdk/project/modules/EmbedModule;

    .end local p1    # "module":Lcom/behance/sdk/project/modules/ProjectModule;
    iget v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->embedModuleCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->embedModuleCount:I

    invoke-virtual {p1, v0}, Lcom/behance/sdk/project/modules/EmbedModule;->setOrder(I)V

    .line 186
    :cond_20
    return-void
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 226
    iget-object v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    if-eqz v1, :cond_9

    .line 227
    iget-object v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/CoverImage;->remove()V

    .line 228
    :cond_9
    iget-object v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 229
    .local v0, "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-interface {v0}, Lcom/behance/sdk/project/modules/ProjectModule;->clear()V

    goto :goto_f

    .line 232
    .end local v0    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_1f
    return-void
.end method

.method public getCopyRight()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->copyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-object v0
.end method

.method public getCoverImage()Lcom/behance/sdk/project/modules/CoverImage;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getFields()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->fields:Ljava/util/List;

    return-object v0
.end method

.method public getImageModules()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 202
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .local v0, "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iget-object v3, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_b
    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 204
    .local v2, "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-interface {v2}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v1

    .line 205
    .local v1, "moduleType":Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    sget-object v4, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-eq v1, v4, :cond_23

    sget-object v4, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v1, v4, :cond_b

    .line 206
    :cond_23
    check-cast v2, Lcom/behance/sdk/project/modules/ImageModule;

    .end local v2    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 209
    .end local v1    # "moduleType":Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    :cond_29
    return-object v0
.end method

.method public getNumberOfProjectModules()I
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getProjectModules()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    return-object v0
.end method

.method public getShareOnFaceBook()Z
    .registers 2

    .prologue
    .line 295
    iget-boolean v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->shareOnFaceBook:Z

    return v0
.end method

.method public getShareOnTwitter()Z
    .registers 2

    .prologue
    .line 303
    iget-boolean v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->shareOnTwitter:Z

    return v0
.end method

.method public getTags()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->tags:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 213
    invoke-virtual {p0}, Lcom/behance/sdk/project/NewBehanceProject;->getNumberOfProjectModules()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isProjectContainsAdultContent()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 235
    iget v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->containAdultContent:I

    if-ne v0, v1, :cond_6

    .line 238
    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public markProjectForAdultContent(Z)V
    .registers 3
    .param p1, "containsAdultContent"    # Z

    .prologue
    .line 246
    if-eqz p1, :cond_6

    .line 247
    const/4 v0, 0x1

    iput v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->containAdultContent:I

    .line 250
    :goto_5
    return-void

    .line 249
    :cond_6
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->containAdultContent:I

    goto :goto_5
.end method

.method public removeAllImageModules()V
    .registers 3

    .prologue
    .line 270
    invoke-virtual {p0}, Lcom/behance/sdk/project/NewBehanceProject;->getImageModules()Ljava/util/List;

    move-result-object v0

    .line 271
    .local v0, "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iget-object v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 272
    return-void
.end method

.method public removeProjectModules(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 3
    .param p1, "module"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    if-eqz v0, :cond_9

    .line 193
    iget-object v0, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 196
    :cond_9
    return-void
.end method

.method public reorderSelectedModules(II)V
    .registers 5
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .prologue
    .line 221
    iget-object v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 222
    .local v0, "fromLocation":Lcom/behance/sdk/project/modules/ProjectModule;
    iget-object v1, p0, Lcom/behance/sdk/project/NewBehanceProject;->projectModules:Ljava/util/List;

    invoke-interface {v1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 223
    return-void
.end method

.method public setCopyRight(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V
    .registers 2
    .param p1, "behanceCopyRightOption"    # Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .prologue
    .line 257
    iput-object p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->copyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 258
    return-void
.end method

.method public setCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V
    .registers 2
    .param p1, "cover"    # Lcom/behance/sdk/project/modules/CoverImage;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    .line 149
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->description:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setFields(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, "fields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iput-object p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->fields:Ljava/util/List;

    .line 119
    return-void
.end method

.method public setShareOnFaceBook(Z)V
    .registers 2
    .param p1, "shareOnFaceBook"    # Z

    .prologue
    .line 291
    iput-boolean p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->shareOnFaceBook:Z

    .line 292
    return-void
.end method

.method public setShareOnTwitter(Z)V
    .registers 2
    .param p1, "shareOnTwitter"    # Z

    .prologue
    .line 299
    iput-boolean p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->shareOnTwitter:Z

    .line 300
    return-void
.end method

.method public setTags(Ljava/lang/String;)V
    .registers 2
    .param p1, "tags"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->tags:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/behance/sdk/project/NewBehanceProject;->title:Ljava/lang/String;

    .line 89
    return-void
.end method
