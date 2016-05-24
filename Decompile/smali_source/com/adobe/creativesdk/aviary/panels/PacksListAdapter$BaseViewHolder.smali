.class abstract Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "PacksListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BaseViewHolder"
.end annotation


# instance fields
.field imageView:Landroid/widget/ImageView;

.field textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 544
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 545
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    .line 546
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->text:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->textView:Landroid/widget/TextView;

    .line 547
    return-void
.end method
