.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$2;
.super Ljava/lang/Object;
.source "StickersPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    .prologue
    .line 1408
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$2;->this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1411
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$2;->this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$2;->this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->onItemClick(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/view/View;)V

    .line 1412
    return-void
.end method
