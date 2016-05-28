.class Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;
.super Ljava/lang/Object;
.source "ExtendableListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WindowRunnnable"
.end annotation


# instance fields
.field private mOriginalAttachCount:I

.field final synthetic this$0:Lcom/etsy/android/grid/ExtendableListView;


# direct methods
.method private constructor <init>(Lcom/etsy/android/grid/ExtendableListView;)V
    .registers 2

    .prologue
    .line 2756
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/etsy/android/grid/ExtendableListView;Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;)V
    .registers 3

    .prologue
    .line 2756
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;-><init>(Lcom/etsy/android/grid/ExtendableListView;)V

    return-void
.end method


# virtual methods
.method public rememberWindowAttachCount()V
    .registers 2

    .prologue
    .line 2760
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->getWindowAttachCount()I
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$16(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v0

    iput v0, p0, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;->mOriginalAttachCount:I

    .line 2761
    return-void
.end method

.method public sameWindow()Z
    .registers 3

    .prologue
    .line 2764
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v0}, Lcom/etsy/android/grid/ExtendableListView;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->getWindowAttachCount()I
    invoke-static {v0}, Lcom/etsy/android/grid/ExtendableListView;->access$16(Lcom/etsy/android/grid/ExtendableListView;)I

    move-result v0

    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView$WindowRunnnable;->mOriginalAttachCount:I

    if-ne v0, v1, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
