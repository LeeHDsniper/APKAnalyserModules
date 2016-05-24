.class Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;
.super Ljava/lang/Object;
.source "PacksListAdapter.java"

# interfaces
.implements Landroid/support/v7/graphics/Palette$PaletteAsyncListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBitmapLoaded(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

.field final synthetic val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

.field final synthetic val$id:J

.field final synthetic val$identifier:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .prologue
    .line 417
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$id:J

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGenerated(Landroid/support/v7/graphics/Palette;)V
    .registers 8
    .param p1, "palette"    # Landroid/support/v7/graphics/Palette;

    .prologue
    .line 420
    if-eqz p1, :cond_39

    .line 421
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->defaultPackTextBackgroundColor:I
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$400(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/support/v7/graphics/Palette;->getVibrantColor(I)I

    move-result v0

    .line 422
    .local v0, "color":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->getItemId()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$id:J

    cmp-long v1, v2, v4

    if-nez v1, :cond_31

    .line 423
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->animateBackgroundColor(Landroid/view/View;I)V

    .line 424
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPacksColorCache:Ljava/util/HashMap;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$800(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;->val$identifier:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    .end local v0    # "color":I
    :goto_30
    return-void

    .line 426
    .restart local v0    # "color":I
    :cond_31
    const-string v1, "PacksListAdapter"

    const-string v2, "invalid item id (2)"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_30

    .line 429
    .end local v0    # "color":I
    :cond_39
    const-string v1, "PacksListAdapter"

    const-string v2, "null palette"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_30
.end method
