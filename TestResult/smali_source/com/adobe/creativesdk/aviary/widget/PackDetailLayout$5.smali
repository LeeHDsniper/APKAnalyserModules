.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 376
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 379
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->loadPreviews(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;ZLandroid/view/View;)V

    .line 380
    return-void
.end method
