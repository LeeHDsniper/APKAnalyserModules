.class public Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
.super Ljava/lang/Object;
.source "BehanceSDKProjectPublishWFManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;,
        Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;


# instance fields
.field private coverImageChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

.field private hideFacebookSharing:Z

.field private hideTwitterSharing:Z

.field private notificationHandlerActivityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private projectModuleChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private selectedImagesForCover:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation
.end field

.field private userCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    new-instance v0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-direct {v0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;-><init>()V

    sput-object v0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->INSTANCE:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x2

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->coverImageChangeListeners:Ljava/util/List;

    .line 78
    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    .registers 1

    .prologue
    .line 71
    sget-object v0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->INSTANCE:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    return-object v0
.end method

.method private notifyListeners()V
    .registers 4

    .prologue
    .line 150
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;

    .line 151
    .local v0, "listener":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v2}, Lcom/behance/sdk/project/NewBehanceProject;->getProjectModules()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;->projectModulesChanged(Ljava/util/List;)V

    goto :goto_6

    .line 153
    .end local v0    # "listener":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
    :cond_1c
    return-void
.end method


# virtual methods
.method public addCoverImageChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->coverImageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 93
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->coverImageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_d
    return-void
.end method

.method public addImageSelectedForProject(Ljava/io/File;)V
    .registers 4
    .param p1, "imageFile"    # Ljava/io/File;

    .prologue
    .line 195
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-nez v1, :cond_7

    .line 196
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->initializeProject()V

    .line 197
    :cond_7
    new-instance v0, Lcom/behance/sdk/project/modules/ImageModule;

    invoke-direct {v0, p1}, Lcom/behance/sdk/project/modules/ImageModule;-><init>(Ljava/io/File;)V

    .line 198
    .local v0, "module":Lcom/behance/sdk/project/modules/ImageModule;
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/project/NewBehanceProject;->addProjectModule(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 199
    invoke-direct {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notifyListeners()V

    .line 200
    return-void
.end method

.method public addImagesSelectedForCover(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "coverImageSelection":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz p1, :cond_1c

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 102
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    if-nez v0, :cond_17

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    .line 104
    :cond_17
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 106
    :cond_1c
    return-void
.end method

.method public addImagesSelectedForProject(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p1, "projectImageSelection":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz p1, :cond_18

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    .line 130
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-nez v0, :cond_f

    .line 131
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->initializeProject()V

    .line 133
    :cond_f
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->addImagesToProject(Ljava/util/List;)V

    .line 134
    invoke-direct {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notifyListeners()V

    .line 141
    :cond_17
    :goto_17
    return-void

    .line 136
    :cond_18
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_17

    .line 137
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->removeAllImageModules()V

    .line 138
    invoke-direct {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notifyListeners()V

    goto :goto_17
.end method

.method public addModuleToCurrentProject(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 3
    .param p1, "projectModule"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-nez v0, :cond_7

    .line 226
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->initializeProject()V

    .line 227
    :cond_7
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->addProjectModule(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 228
    invoke-direct {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notifyListeners()V

    .line 229
    return-void
.end method

.method public addProjectModuleChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 84
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    :cond_d
    return-void
.end method

.method public cancelWorkflow()V
    .registers 6

    .prologue
    .line 304
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getImagesSelectedForProject()Ljava/util/List;

    move-result-object v1

    .line 305
    .local v1, "imagesSelectedForProject":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz v1, :cond_28

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_28

    .line 306
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_10
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 307
    .local v0, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    sget-object v3, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v0}, Lcom/behance/sdk/project/modules/ImageModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v4

    if-ne v3, v4, :cond_10

    .line 308
    invoke-virtual {v0}, Lcom/behance/sdk/project/modules/ImageModule;->deleteFromFileSystem()V

    goto :goto_10

    .line 312
    .end local v0    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_28
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->finishWorkflow()V

    .line 314
    return-void
.end method

.method public clearImagesSelectedForCover()V
    .registers 6

    .prologue
    .line 156
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    if-eqz v2, :cond_36

    .line 157
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v2}, Lcom/behance/sdk/project/NewBehanceProject;->getImageModules()Ljava/util/List;

    move-result-object v0

    .line 158
    .local v0, "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_10
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 159
    .local v1, "module":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-interface {v1}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v3

    sget-object v4, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v3, v4, :cond_10

    .line 160
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    .line 161
    invoke-interface {v1}, Lcom/behance/sdk/project/modules/ProjectModule;->deleteFromFileSystem()V

    goto :goto_10

    .line 165
    .end local v1    # "module":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_2e
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 166
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    .line 168
    .end local v0    # "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    :cond_36
    return-void
.end method

.method public finishWorkflow()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 317
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->clearImagesSelectedForCover()V

    .line 318
    invoke-virtual {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->removeAllModuleChangeListeners()V

    .line 319
    invoke-virtual {p0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setUserCredentials(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V

    .line 320
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_15

    .line 321
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->clear()V

    .line 322
    iput-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    .line 324
    :cond_15
    return-void
.end method

.method public getCopyrightOption()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 288
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getCopyRight()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v0

    .line 289
    :goto_a
    return-object v0

    :cond_b
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->BY_NC:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    goto :goto_a
.end method

.method public getImagesSelectedForCover()Ljava/util/List;
    .registers 4
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
    .line 110
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v1, "imagesForCover":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v2, :cond_1a

    .line 112
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v2}, Lcom/behance/sdk/project/NewBehanceProject;->getImageModules()Ljava/util/List;

    move-result-object v0

    .line 113
    .local v0, "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz v0, :cond_1a

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1a

    .line 114
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 117
    .end local v0    # "imageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    :cond_1a
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    if-eqz v2, :cond_2b

    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2b

    .line 118
    iget-object v2, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->selectedImagesForCover:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 120
    :cond_2b
    return-object v1
.end method

.method public getImagesSelectedForProject()Ljava/util/List;
    .registers 3
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
    .line 178
    const/4 v0, 0x0

    .line 179
    .local v0, "selectedImagesForProject":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v1, :cond_b

    .line 180
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v1}, Lcom/behance/sdk/project/NewBehanceProject;->getImageModules()Ljava/util/List;

    move-result-object v0

    .line 181
    :cond_b
    return-object v0
.end method

.method public getNotificationHandlerActivityClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 366
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notificationHandlerActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getProjectDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 269
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 270
    :goto_a
    return-object v0

    :cond_b
    const-string v0, ""

    goto :goto_a
.end method

.method public getProjectFields()Ljava/util/List;
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
    .line 257
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 258
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getFields()Ljava/util/List;

    move-result-object v0

    .line 259
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
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
    .line 186
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-nez v0, :cond_6

    .line 187
    const/4 v0, 0x0

    .line 188
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getProjectModules()Ljava/util/List;

    move-result-object v0

    goto :goto_5
.end method

.method public getProjectTags()Ljava/lang/String;
    .registers 2

    .prologue
    .line 246
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 247
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getTags()Ljava/lang/String;

    move-result-object v0

    .line 248
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getProjectTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 237
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 238
    :goto_a
    return-object v0

    :cond_b
    const-string v0, ""

    goto :goto_a
.end method

.method public getSelectedCoverImage()Lcom/behance/sdk/project/modules/CoverImage;
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 210
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getCoverImage()Lcom/behance/sdk/project/modules/CoverImage;

    move-result-object v0

    .line 211
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getShareOnFaceBook()Z
    .registers 2

    .prologue
    .line 354
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 355
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getShareOnFaceBook()Z

    move-result v0

    .line 356
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getShareOnTwitter()Z
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 361
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->getShareOnTwitter()Z

    move-result v0

    .line 362
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->userCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    return-object v0
.end method

.method public initializeProject()V
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-nez v0, :cond_b

    .line 146
    new-instance v0, Lcom/behance/sdk/project/NewBehanceProject;

    invoke-direct {v0}, Lcom/behance/sdk/project/NewBehanceProject;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    .line 147
    :cond_b
    return-void
.end method

.method public isEmptyProject()Z
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 338
    :cond_c
    const/4 v0, 0x1

    .line 340
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isHideFacebookSharing()Z
    .registers 2

    .prologue
    .line 382
    iget-boolean v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->hideFacebookSharing:Z

    return v0
.end method

.method public isHideTwitterSharing()Z
    .registers 2

    .prologue
    .line 374
    iget-boolean v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->hideTwitterSharing:Z

    return v0
.end method

.method public isProjectContainsAdultContent()Z
    .registers 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_b

    .line 299
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0}, Lcom/behance/sdk/project/NewBehanceProject;->isProjectContainsAdultContent()Z

    move-result v0

    .line 300
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public removeAllModuleChangeListeners()V
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_9

    .line 172
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 174
    :cond_9
    return-void
.end method

.method public removeCoverImageChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->coverImageChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 98
    return-void
.end method

.method public removeProjectModule(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 4
    .param p1, "projectModule"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 327
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 328
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->removeProjectModules(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 329
    :cond_9
    invoke-interface {p1}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v0

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v0, v1, :cond_16

    .line 330
    check-cast p1, Lcom/behance/sdk/project/modules/ImageModule;

    .end local p1    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->recycleImageBitmap()V

    .line 333
    :cond_16
    invoke-direct {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notifyListeners()V

    .line 334
    return-void
.end method

.method public removeProjectModuleChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public reorderSelectedModules(II)V
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .prologue
    .line 203
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 204
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1, p2}, Lcom/behance/sdk/project/NewBehanceProject;->reorderSelectedModules(II)V

    .line 205
    :cond_9
    invoke-direct {p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->notifyListeners()V

    .line 206
    return-void
.end method

.method public rotateImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 5
    .param p1, "projectModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 390
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->rotateImage()V

    .line 391
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->projectModuleChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;

    .line 392
    .local v0, "listener":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
    invoke-interface {v0, p1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;->rotateImage(Lcom/behance/sdk/project/modules/ImageModule;)V

    goto :goto_9

    .line 394
    .end local v0    # "listener":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
    :cond_19
    return-void
.end method

.method public setContainsAdultContent(Z)V
    .registers 3
    .param p1, "containsAdultContent"    # Z

    .prologue
    .line 293
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 294
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->markProjectForAdultContent(Z)V

    .line 295
    :cond_9
    return-void
.end method

.method public setCopyrightOption(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V
    .registers 3
    .param p1, "selectedCopyRight"    # Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .prologue
    .line 282
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 283
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setCopyRight(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V

    .line 284
    :cond_9
    return-void
.end method

.method public setProjectDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "projectDesc"    # Ljava/lang/String;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 264
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setDescription(Ljava/lang/String;)V

    .line 265
    :cond_9
    return-void
.end method

.method public setProjectFields(Ljava/util/List;)V
    .registers 3
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
    .line 252
    .local p1, "projectFields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 253
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setFields(Ljava/util/List;)V

    .line 254
    :cond_9
    return-void
.end method

.method public setProjectTags(Ljava/lang/String;)V
    .registers 3
    .param p1, "projectTags"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 243
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setTags(Ljava/lang/String;)V

    .line 244
    :cond_9
    return-void
.end method

.method public setProjectTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "projectTitle"    # Ljava/lang/String;

    .prologue
    .line 232
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 233
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setTitle(Ljava/lang/String;)V

    .line 234
    :cond_9
    return-void
.end method

.method public setSelectedCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V
    .registers 5
    .param p1, "cover"    # Lcom/behance/sdk/project/modules/CoverImage;

    .prologue
    .line 216
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v1, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V

    .line 217
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->coverImageChangeListeners:Ljava/util/List;

    if-eqz v1, :cond_1f

    .line 218
    iget-object v1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->coverImageChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;

    .line 219
    .local v0, "listener":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;
    invoke-interface {v0, p1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;->coverImageChanges(Lcom/behance/sdk/project/modules/CoverImage;)V

    goto :goto_f

    .line 222
    .end local v0    # "listener":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;
    :cond_1f
    return-void
.end method

.method public setShareOnFaceBook(Z)V
    .registers 3
    .param p1, "shareOnFaceBook"    # Z

    .prologue
    .line 344
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 345
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setShareOnFaceBook(Z)V

    .line 346
    :cond_9
    return-void
.end method

.method public setShareOnTwitter(Z)V
    .registers 3
    .param p1, "shareOnTwitter"    # Z

    .prologue
    .line 349
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    if-eqz v0, :cond_9

    .line 350
    iget-object v0, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->currentBehanceProject:Lcom/behance/sdk/project/NewBehanceProject;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/NewBehanceProject;->setShareOnTwitter(Z)V

    .line 351
    :cond_9
    return-void
.end method

.method public setUserCredentials(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V
    .registers 2
    .param p1, "userCredentials"    # Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .prologue
    .line 278
    iput-object p1, p0, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->userCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .line 279
    return-void
.end method
