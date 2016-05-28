.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;
.super Ljava/lang/Object;
.source "StickersPanel.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

.field final synthetic val$holder:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    .prologue
    .line 1383
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 12
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1386
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 1388
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 1389
    .local v3, "intent":Landroid/content/Intent;
    const-string v5, "contentPath"

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->getContentPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1390
    const-string v5, "identifier"

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->identifier:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1391
    const-string v5, "width"

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1392
    const-string v5, "height"

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1394
    new-instance v4, Landroid/content/ClipData$Item;

    invoke-direct {v4, v3}, Landroid/content/ClipData$Item;-><init>(Landroid/content/Intent;)V

    .line 1396
    .local v4, "item":Landroid/content/ClipData$Item;
    new-instance v1, Landroid/content/ClipData;

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 1397
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/String;

    const-string v7, "text/plain"

    aput-object v7, v6, v8

    invoke-direct {v1, v5, v6, v4}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    .line 1401
    .local v1, "dragData":Landroid/content/ClipData;
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->imageView:Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->this$1:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mScaleFactor:F
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->access$100(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)F

    move-result v6

    invoke-direct {v0, v5, v6}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;-><init>(Landroid/view/View;F)V

    .line 1402
    .local v0, "builder":Landroid/view/View$DragShadowBuilder;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->imageView:Landroid/widget/ImageView;

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v0, v6, v8}, Landroid/widget/ImageView;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    .line 1403
    return v9
.end method
