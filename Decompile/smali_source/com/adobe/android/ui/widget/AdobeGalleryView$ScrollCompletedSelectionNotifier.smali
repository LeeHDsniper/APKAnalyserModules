.class Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;
.super Ljava/lang/Object;
.source "AdobeGalleryView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeGalleryView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollCompletedSelectionNotifier"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;


# direct methods
.method private constructor <init>(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V
    .registers 2

    .prologue
    .line 1362
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/android/ui/widget/AdobeGalleryView;Lcom/adobe/android/ui/widget/AdobeGalleryView$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/android/ui/widget/AdobeGalleryView;
    .param p2, "x1"    # Lcom/adobe/android/ui/widget/AdobeGalleryView$1;

    .prologue
    .line 1362
    invoke-direct {p0, p1}, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;-><init>(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1365
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget-boolean v0, v0, Lcom/adobe/android/ui/widget/AdobeGalleryView;->mDataChanged:Z

    if-eqz v0, :cond_14

    .line 1366
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 1367
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->post(Ljava/lang/Runnable;)Z

    .line 1372
    :cond_13
    :goto_13
    return-void

    .line 1370
    :cond_14
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$ScrollCompletedSelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    # invokes: Lcom/adobe/android/ui/widget/AdobeGalleryView;->fireOnScrollCompleted()V
    invoke-static {v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->access$200(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V

    goto :goto_13
.end method
