.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;
.super Ljava/lang/Object;
.source "PackDetailPreviews.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showPreviews(Landroid/database/Cursor;DLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

.field final synthetic val$aspectRatio:D

.field final synthetic val$cursor:Landroid/database/Cursor;

.field final synthetic val$previewPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/database/Cursor;DLjava/lang/String;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 328
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->val$cursor:Landroid/database/Cursor;

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->val$aspectRatio:D

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->val$previewPath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 6

    .prologue
    .line 331
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v0, :cond_1d

    .line 332
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$300(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 336
    :goto_11
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->val$cursor:Landroid/database/Cursor;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->val$aspectRatio:D

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->val$previewPath:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showPreviews(Landroid/database/Cursor;DLjava/lang/String;)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$400(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/database/Cursor;DLjava/lang/String;)V

    .line 337
    return-void

    .line 334
    :cond_1d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$300(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_11
.end method
