.class Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;
.super Ljava/lang/Object;
.source "StoreDetailLayout.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 5

    .prologue
    .line 48
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v0, :cond_20

    .line 49
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 53
    :goto_f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->loadPreviews(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;ZLandroid/view/View;)V

    .line 54
    return-void

    .line 51
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_f
.end method
