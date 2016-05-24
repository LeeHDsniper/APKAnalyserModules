.class Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;
.super Ljava/lang/Object;
.source "PacksListAdapter.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBindContentViewHolder(ILcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

.field final synthetic val$file:Ljava/lang/String;

.field final synthetic val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .prologue
    .line 349
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;->val$file:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 3

    .prologue
    .line 357
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 358
    return-void
.end method

.method public onSuccess()V
    .registers 3

    .prologue
    .line 352
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;->val$file:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 353
    return-void
.end method
