.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;
.super Ljava/lang/Object;
.source "AdobeAssetViewCCFilesWithUploadContainerFragment.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->registerLocalNofications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .prologue
    .line 723
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 9
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const v4, 0x1020002

    const/4 v5, 0x0

    .line 727
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    move-object v1, p2

    .line 728
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 729
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesCollaborationChangeTitleToCollaborator:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v2, v3, :cond_52

    .line 731
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->hideMenu()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V

    .line 732
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->useDropDownActionBar()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 733
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaborator:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v5, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->setDropDownDetails(ZLjava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 744
    :cond_37
    :goto_37
    return-void

    .line 735
    :cond_38
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/support/v4/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaborator:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    goto :goto_37

    .line 737
    :cond_52
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesCollaborationChangeTitleToTargetAsset:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v2, v3, :cond_37

    .line 739
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->useDropDownActionBar()Z

    move-result v2

    if-eqz v2, :cond_75

    .line 740
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getCurrentTargetCollectionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v5, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->setDropDownDetails(ZLjava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 743
    :goto_6f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->showMenu()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V

    goto :goto_37

    .line 742
    :cond_75
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/support/v4/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getCurrentTargetCollectionName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    goto :goto_6f
.end method
