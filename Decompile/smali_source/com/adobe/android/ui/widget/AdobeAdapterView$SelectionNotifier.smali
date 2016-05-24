.class Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;
.super Ljava/lang/Object;
.source "AdobeAdapterView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeAdapterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SelectionNotifier"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;


# direct methods
.method private constructor <init>(Lcom/adobe/android/ui/widget/AdobeAdapterView;)V
    .registers 2

    .prologue
    .line 675
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>.SelectionNotifier;"
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/android/ui/widget/AdobeAdapterView;Lcom/adobe/android/ui/widget/AdobeAdapterView$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/android/ui/widget/AdobeAdapterView;
    .param p2, "x1"    # Lcom/adobe/android/ui/widget/AdobeAdapterView$1;

    .prologue
    .line 675
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>.SelectionNotifier;"
    invoke-direct {p0, p1}, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;-><init>(Lcom/adobe/android/ui/widget/AdobeAdapterView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 678
    .local p0, "this":Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<TT;>.SelectionNotifier;"
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    iget-boolean v0, v0, Lcom/adobe/android/ui/widget/AdobeAdapterView;->mDataChanged:Z

    if-eqz v0, :cond_14

    .line 679
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 680
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->post(Ljava/lang/Runnable;)Z

    .line 685
    :cond_13
    :goto_13
    return-void

    .line 683
    :cond_14
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeAdapterView$SelectionNotifier;->this$0:Lcom/adobe/android/ui/widget/AdobeAdapterView;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeAdapterView;->fireOnSelected()V

    goto :goto_13
.end method
