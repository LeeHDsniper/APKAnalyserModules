.class public Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;
.super Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;
.source "BehanceSDKPublishProjectPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;
.implements Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
.implements Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;
.implements Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;
.implements Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private editEmptyProjectMessage:Landroid/view/View;

.field private editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

.field private editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

.field private previewEditViewFlipper:Landroid/widget/ViewFlipper;

.field private previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

.field private previewModulesListView:Landroid/widget/ListView;

.field private progressBar:Landroid/widget/ProgressBar;

.field private publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

.field private selectedCameraImageUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 74
    const-class v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;-><init>()V

    .line 88
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->launchCameraToCapturePicture()V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->launchCreativeCloudAssetBrowser()V

    return-void
.end method

.method static synthetic access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayEditModulesView(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    return-object v0
.end method

.method static synthetic access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyPreviewViewGridAdapter()V

    return-void
.end method

.method private displayEditModulesView(Ljava/util/List;Z)V
    .registers 6
    .param p2, "animateViewDisplay"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    const/4 v2, 0x0

    .line 244
    if-eqz p1, :cond_9

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 245
    :cond_9
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->showEmptyProjectMessage()V

    .line 252
    :goto_c
    if-eqz p2, :cond_3f

    .line 253
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_publish_project_edit_enter_anim:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 254
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_publish_project_preview_exit_anim:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 259
    :goto_24
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 260
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->updateNavigationControls()V

    .line 261
    return-void

    .line 248
    :cond_2e
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editEmptyProjectMessage:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 249
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setVisibility(I)V

    .line 250
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->initializeListView(Ljava/util/List;)V

    goto :goto_c

    .line 256
    :cond_3f
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 257
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    goto :goto_24
.end method

.method private displayEditModulesView(Z)V
    .registers 4
    .param p1, "animateViewDisplay"    # Z

    .prologue
    .line 271
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectModules()Ljava/util/List;

    move-result-object v0

    .line 272
    .local v0, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    invoke-direct {p0, v0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayEditModulesView(Ljava/util/List;Z)V

    .line 273
    return-void
.end method

.method private displayPreviewModulesView(ZZ)V
    .registers 10
    .param p1, "animateViewDisplay"    # Z
    .param p2, "forceCreate"    # Z

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 223
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v2}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectModules()Ljava/util/List;

    move-result-object v1

    .line 224
    .local v1, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    if-eqz v2, :cond_e

    if-eqz p2, :cond_40

    .line 225
    :cond_e
    new-instance v2, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_preview_project_fragment_list_item:I

    invoke-direct {v2, v3, v4, v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    .line 226
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewModulesListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 227
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    invoke-virtual {v2, p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->setCallbacks(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;)V

    .line 228
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$fraction;->bsdk_add_project_preview_fragment_screen_width_percentage:I

    invoke-virtual {v2, v3, v5, v5}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    .line 229
    .local v0, "fraction":F
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewModulesListView:Landroid/widget/ListView;

    invoke-static {v2, v3, v0}, Lcom/behance/sdk/util/BehanceSDKUtils;->setContentViewPaddings(Landroid/content/Context;Landroid/view/View;F)V

    .line 230
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewModulesListView:Landroid/widget/ListView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 232
    .end local v0    # "fraction":F
    :cond_40
    if-eqz p1, :cond_62

    .line 233
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$anim;->bsdk_publish_project_preview_enter_anim:I

    invoke-virtual {v2, v3, v4}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 234
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$anim;->bsdk_publish_project_edit_exit_anim:I

    invoke-virtual {v2, v3, v4}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 239
    :goto_58
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 240
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->updateNavigationControls()V

    .line 241
    return-void

    .line 236
    :cond_62
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v6}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 237
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v6}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    goto :goto_58
.end method

.method private initializeEditProjectScreen()V
    .registers 9

    .prologue
    .line 170
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditProjectModulesListView:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 171
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditEmptyProjectMessageLayout:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editEmptyProjectMessage:Landroid/view/View;

    .line 172
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditOptionAlbums:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 173
    .local v0, "albums":Landroid/view/View;
    new-instance v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$1;

    invoke-direct {v6, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    invoke-virtual {v0, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditOptionCamera:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 184
    .local v1, "camera":Landroid/view/View;
    new-instance v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$2;

    invoke-direct {v6, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditOptionEmbed:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 192
    .local v4, "embed":Landroid/view/View;
    new-instance v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$3;

    invoke-direct {v6, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$3;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditOptionCreativeCloud:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 203
    .local v2, "creativeCloud":Landroid/view/View;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v5

    .line 204
    .local v5, "sharedCloudManager":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v3

    .line 206
    .local v3, "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-nez v3, :cond_5e

    .line 207
    const/16 v6, 0x8

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 220
    :goto_5d
    return-void

    .line 209
    :cond_5e
    new-instance v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$4;

    invoke-direct {v6, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$4;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    invoke-virtual {v2, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_5d
.end method

.method private initializeListView(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 491
    .local p1, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    new-instance v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_edit_fragment_grid_item:I

    invoke-direct {v1, v2, v3, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    .line 492
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 493
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v1, p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setRemoveListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveListener;)V

    .line 494
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    invoke-virtual {v1, p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->setCallBack(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;)V

    .line 495
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    .line 504
    .local v0, "onDrop":Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setDropListener(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;)V

    .line 506
    return-void
.end method

.method private initializePreviewProjectScreen()V
    .registers 3

    .prologue
    .line 158
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewProjectModulesListView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewModulesListView:Landroid/widget/ListView;

    .line 159
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewPrgressBar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 160
    return-void
.end method

.method private isEmptyProject()Z
    .registers 3

    .prologue
    .line 389
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectModules()Ljava/util/List;

    move-result-object v0

    .line 390
    .local v0, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    if-eqz v0, :cond_e

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 391
    :cond_e
    const/4 v1, 0x1

    .line 392
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method private isPreviewScreen()Z
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private launchCameraToCapturePicture()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 444
    :try_start_2
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->createTempImageFile()Ljava/io/File;

    move-result-object v1

    .line 445
    .local v1, "photoFile":Ljava/io/File;
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 447
    .local v2, "takePictureIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v3

    if-eqz v3, :cond_2f

    .line 449
    if-eqz v1, :cond_2e

    .line 451
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    .line 452
    const-string v3, "output"

    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 453
    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 463
    .end local v1    # "photoFile":Ljava/io/File;
    .end local v2    # "takePictureIntent":Landroid/content/Intent;
    :cond_2e
    :goto_2e
    return-void

    .line 456
    .restart local v1    # "photoFile":Ljava/io/File;
    .restart local v2    # "takePictureIntent":Landroid/content/Intent;
    :cond_2f
    sget-object v3, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v4, "Camera intent not found"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 457
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_add_wip_pick_source_view_camera_launch_error:I

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_47} :catch_48

    goto :goto_2e

    .line 459
    .end local v1    # "photoFile":Ljava/io/File;
    .end local v2    # "takePictureIntent":Landroid/content/Intent;
    :catch_48
    move-exception v0

    .line 460
    .local v0, "ex":Ljava/io/IOException;
    sget-object v3, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v4, "Problem creating temp file to capture image"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-interface {v3, v0, v4, v5}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 461
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_add_wip_pick_source_view_camera_launch_error:I

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_2e
.end method

.method private launchCreativeCloudAssetBrowser()V
    .registers 8

    .prologue
    .line 432
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 433
    .local v1, "context":Landroid/app/Activity;
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;

    invoke-direct {v2, v1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 434
    .local v2, "detailsIntent":Landroid/content/Intent;
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-static {v4, v5, v6}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v3

    .line 435
    .local v3, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_MULTI_SELECT_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-static {v4, v5}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    .line 436
    .local v0, "browserOptions":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;>;"
    const-string v4, "ARGS_ALLOWED_MIME_TYPES"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 437
    const-string v4, "ARGS_ASSET_BROWSER_OPTIONS"

    invoke-virtual {v2, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 438
    const-string v4, "ARGS_IMAGE_VALIDATOR_TYPE"

    const-string v5, "PUBLISH_PROJECT_IMAGE_VALIDATOR"

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 439
    const/16 v4, 0x1a83

    invoke-virtual {v1, v2, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 440
    return-void
.end method

.method private notifyEditViewGridAdapter(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 482
    .local p1, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    if-eqz v0, :cond_a

    .line 483
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->notifyDataSetChanged()V

    .line 488
    :goto_9
    return-void

    .line 486
    :cond_a
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayEditModulesView(Ljava/util/List;Z)V

    goto :goto_9
.end method

.method private notifyPreviewViewGridAdapter()V
    .registers 2

    .prologue
    .line 477
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    if-eqz v0, :cond_9

    .line 478
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->notifyDataSetChanged()V

    .line 479
    :cond_9
    return-void
.end method

.method private showEmptyProjectMessage()V
    .registers 3

    .prologue
    .line 264
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->disableActionBarRightNav()V

    .line 265
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editEmptyProjectMessage:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 266
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->setVisibility(I)V

    .line 267
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    .line 268
    return-void
.end method


# virtual methods
.method protected backButtonPressed()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 407
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 408
    .local v0, "displayedChild":I
    if-ne v0, v2, :cond_14

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isEmptyProject()Z

    move-result v1

    if-nez v1, :cond_14

    .line 409
    const/4 v1, 0x0

    invoke-direct {p0, v2, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayPreviewModulesView(ZZ)V

    .line 413
    :goto_13
    return-void

    .line 411
    :cond_14
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->backButtonPressed()V

    goto :goto_13
.end method

.method protected enableActionBarRightNav()V
    .registers 2

    .prologue
    .line 383
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isEmptyProject()Z

    move-result v0

    if-nez v0, :cond_9

    .line 384
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->enableActionBarRightNav()V

    .line 385
    :cond_9
    return-void
.end method

.method protected getBackButtonID()I
    .registers 2

    .prologue
    .line 277
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isPreviewScreen()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 278
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragmentTitlebarBackBtnLayout:I

    .line 280
    :goto_8
    return v0

    :cond_9
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getBackButtonID()I

    move-result v0

    goto :goto_8
.end method

.method protected getForwardButtonID()I
    .registers 2

    .prologue
    .line 285
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isPreviewScreen()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 286
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragmentTitlebarActionBtnTxtView:I

    .line 288
    :goto_8
    return v0

    :cond_9
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getForwardButtonID()I

    move-result v0

    goto :goto_8
.end method

.method protected getForwardButtonText()I
    .registers 2

    .prologue
    .line 305
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isPreviewScreen()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 306
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getForwardButtonText()I

    move-result v0

    .line 308
    :goto_a
    return v0

    :cond_b
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_project_edit_project_fragment_right_navigation:I

    goto :goto_a
.end method

.method protected getLayout()I
    .registers 2

    .prologue
    .line 107
    sget v0, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_publish_project_preview:I

    return v0
.end method

.method protected getTitle()I
    .registers 2

    .prologue
    .line 313
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isPreviewScreen()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 314
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_project_preview_project_fragment_title:I

    .line 316
    :goto_8
    return v0

    :cond_9
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_project_edit_project_fragment_title:I

    goto :goto_8
.end method

.method protected getTitleViewID()I
    .registers 2

    .prologue
    .line 297
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isPreviewScreen()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 298
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragmentTitlebarTitleTxtView:I

    .line 300
    :goto_8
    return v0

    :cond_9
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getTitleViewID()I

    move-result v0

    goto :goto_8
.end method

.method protected nextButtonPressed()V
    .registers 4

    .prologue
    .line 397
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 398
    .local v0, "displayedChild":I
    if-nez v0, :cond_c

    .line 399
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->nextButtonPressed()V

    .line 403
    :goto_b
    return-void

    .line 401
    :cond_c
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayPreviewModulesView(ZZ)V

    goto :goto_b
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 15
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    const/4 v10, 0x0

    const/4 v6, -0x1

    .line 344
    sparse-switch p1, :sswitch_data_92

    .line 379
    :cond_6
    :goto_6
    return-void

    .line 346
    :sswitch_7
    if-ne p2, v6, :cond_42

    .line 347
    sget-object v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v7, "Camera Activity returned with ok result. [Photo Uri - %s]"

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    aput-object v9, v8, v10

    invoke-interface {v6, v7, v8}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 348
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    if-eqz v6, :cond_6

    .line 349
    new-instance v1, Ljava/io/File;

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 350
    .local v1, "cameraImageFile":Ljava/io/File;
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addImageSelectedForProject(Ljava/io/File;)V

    .line 352
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/behance/sdk/util/BehanceSDKUtils;->addImageToGallery(Landroid/content/Context;Ljava/lang/String;)V

    .line 353
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectModules()Ljava/util/List;

    move-result-object v5

    .line 354
    .local v5, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyEditViewGridAdapter(Ljava/util/List;)V

    .line 355
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->enableActionBarRightNav()V

    goto :goto_6

    .line 358
    .end local v1    # "cameraImageFile":Ljava/io/File;
    .end local v5    # "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    :cond_42
    sget-object v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v7, "Camera Activity returned with not ok result. [Result - %s]"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-interface {v6, v7, v8}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_6

    .line 362
    :sswitch_52
    if-ne p2, v6, :cond_6

    .line 363
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 364
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v6, "ACTIVITY_CC_SUCCESSFULLY_DOWNLOADED_FILES"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 365
    .local v2, "downloadedFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    if-eqz v2, :cond_6

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    .line 366
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_83

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    .line 367
    .local v3, "imageFile":Ljava/io/File;
    new-instance v4, Lcom/behance/sdk/project/modules/CreativeCloudAssetModule;

    invoke-direct {v4, v3}, Lcom/behance/sdk/project/modules/CreativeCloudAssetModule;-><init>(Ljava/io/File;)V

    .line 368
    .local v4, "module":Lcom/behance/sdk/project/modules/ProjectModule;
    iget-object v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v7, v4}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addModuleToCurrentProject(Lcom/behance/sdk/project/modules/ProjectModule;)V

    goto :goto_6c

    .line 370
    .end local v3    # "imageFile":Ljava/io/File;
    .end local v4    # "module":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_83
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectModules()Ljava/util/List;

    move-result-object v5

    .line 371
    .restart local v5    # "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyEditViewGridAdapter(Ljava/util/List;)V

    .line 372
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->enableActionBarRightNav()V

    goto/16 :goto_6

    .line 344
    nop

    :sswitch_data_92
    .sparse-switch
        0x1 -> :sswitch_7
        0x1a83 -> :sswitch_52
    .end sparse-switch
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 112
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onAttach(Landroid/app/Activity;)V

    .line 113
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addProjectModuleChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;)V

    .line 114
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 124
    invoke-super {p0, p1, p2, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 125
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v2, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewAndEditViewFlipper:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ViewFlipper;

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    .line 126
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->initializePreviewProjectScreen()V

    .line 127
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->initializeEditProjectScreen()V

    .line 128
    const/4 v0, 0x0

    .line 129
    .local v0, "childIndexToDisplay":I
    if-eqz p3, :cond_3f

    .line 130
    const-string v1, "BUNDLE_KEY_CAMERA_IMAGE_URI_EDIT_FRAGMENT"

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    .line 131
    const-string v1, "BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX_EDIT_PREVIEW_FRAGMENT"

    invoke-virtual {p3, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 136
    :cond_2a
    :goto_2a
    if-nez v0, :cond_47

    .line 137
    invoke-direct {p0, v3, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayPreviewModulesView(ZZ)V

    .line 138
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->enableActionBarRightNav()V

    .line 142
    :goto_32
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 143
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 144
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    return-object v1

    .line 132
    :cond_3f
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->isEmptyProject()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 133
    const/4 v0, 0x1

    goto :goto_2a

    .line 140
    :cond_47
    invoke-direct {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->displayEditModulesView(Z)V

    goto :goto_32
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 118
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onDetach()V

    .line 119
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->removeProjectModuleChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;)V

    .line 120
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 150
    const/4 v0, 0x4

    if-ne p2, v0, :cond_e

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_e

    .line 151
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->backButtonPressed()V

    .line 152
    const/4 v0, 0x1

    .line 154
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onRotate(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 3
    .param p1, "projectModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 510
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->rotateImage(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 511
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 422
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 423
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_12

    .line 424
    const-string v0, "BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX_EDIT_PREVIEW_FRAGMENT"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 425
    :cond_12
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    if-eqz v0, :cond_1d

    .line 426
    const-string v0, "BUNDLE_KEY_CAMERA_IMAGE_URI_EDIT_FRAGMENT"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->selectedCameraImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 427
    :cond_1d
    return-void
.end method

.method public onViewLoadingComplete()V
    .registers 3

    .prologue
    .line 164
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 165
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewModulesListView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 166
    return-void
.end method

.method public projectModulesChanged(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 467
    .local p1, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 468
    :cond_8
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->disableActionBarRightNav()V

    .line 473
    :goto_b
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyPreviewViewGridAdapter()V

    .line 474
    return-void

    .line 470
    :cond_f
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->enableActionBarRightNav()V

    .line 471
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyEditViewGridAdapter(Ljava/util/List;)V

    goto :goto_b
.end method

.method public remove(I)V
    .registers 6
    .param p1, "which"    # I

    .prologue
    .line 515
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    invoke-virtual {v2, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 516
    .local v0, "item":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-interface {v0}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v2

    sget-object v3, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v2, v3}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    move-object v1, v0

    .line 517
    check-cast v1, Lcom/behance/sdk/project/modules/ImageModule;

    .line 518
    .local v1, "module":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/ImageModule;->clearRotation()V

    .line 520
    .end local v1    # "module":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_1a
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v2, v0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->removeProjectModule(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 521
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v2}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isEmptyProject()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 522
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->showEmptyProjectMessage()V

    .line 526
    :goto_2a
    return-void

    .line 524
    :cond_2b
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    invoke-virtual {v2}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->notifyDataSetChanged()V

    goto :goto_2a
.end method

.method public rotateImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 2
    .param p1, "module"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 530
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyPreviewViewGridAdapter()V

    .line 531
    return-void
.end method

.method protected updateNavigationControls()V
    .registers 5

    .prologue
    .line 321
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->updateNavigationControls()V

    .line 323
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->rootView:Landroid/view/View;

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragmentTitlebarEditActionBtnTxtView:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 324
    .local v1, "editProject":Landroid/view/View;
    new-instance v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$5;

    invoke-direct {v2, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$5;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 331
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    if-eqz v2, :cond_23

    .line 332
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->previewEditViewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 333
    .local v0, "displayedChild":I
    if-nez v0, :cond_24

    .line 334
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 340
    .end local v0    # "displayedChild":I
    :cond_23
    :goto_23
    return-void

    .line 336
    .restart local v0    # "displayedChild":I
    :cond_24
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_23
.end method
