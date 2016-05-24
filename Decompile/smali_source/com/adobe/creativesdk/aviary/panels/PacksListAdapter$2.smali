.class Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;
.super Ljava/lang/Object;
.source "PacksListAdapter.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBindExternalViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

.field final synthetic val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

.field final synthetic val$id:J

.field final synthetic val$identifier:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;JLjava/lang/String;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .prologue
    .line 382
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->val$id:J

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 3

    .prologue
    .line 399
    const-string v0, "PacksListAdapter"

    const-string v1, "paletter generated error"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    return-void
.end method

.method public onSuccess()V
    .registers 6

    .prologue
    .line 394
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->val$holder:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    check-cast v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->val$id:J

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;->val$identifier:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBitmapLoaded(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V
    invoke-static {v1, v0, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$700(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V

    .line 395
    return-void
.end method
