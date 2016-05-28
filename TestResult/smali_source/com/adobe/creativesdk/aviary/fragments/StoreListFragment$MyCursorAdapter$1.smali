.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

.field final synthetic val$holder:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

.field final synthetic val$iconPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

    .prologue
    .line 690
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;->val$iconPath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 1

    .prologue
    .line 698
    return-void
.end method

.method public onSuccess()V
    .registers 3

    .prologue
    .line 693
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;->val$holder:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;->val$iconPath:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 694
    return-void
.end method
