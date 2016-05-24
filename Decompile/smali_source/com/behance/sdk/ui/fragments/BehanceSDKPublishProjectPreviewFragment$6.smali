.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectPreviewFragment.java"

# interfaces
.implements Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->initializeListView(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    .prologue
    .line 495
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public drop(II)V
    .registers 4
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 498
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->publishProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->access$300(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->reorderSelectedModules(II)V

    .line 499
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editModulesDragSortListView:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->moveCheckState(II)V

    .line 500
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->editImageAdapter:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->notifyDataSetChanged()V

    .line 501
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment$6;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;

    # invokes: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->notifyPreviewViewGridAdapter()V
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;->access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment;)V

    .line 502
    return-void
.end method
