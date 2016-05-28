.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

.field icon:Landroid/widget/ImageView;

.field identifier:Ljava/lang/String;

.field isFreeWithLogin:I

.field itemsCount:I

.field packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field packid:J

.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

.field title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

    .prologue
    .line 582
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 590
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->itemsCount:I

    return-void
.end method


# virtual methods
.method public setItemCount(ILcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 3
    .param p1, "value"    # I
    .param p2, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 593
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 594
    iput p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->itemsCount:I

    .line 595
    return-void
.end method
