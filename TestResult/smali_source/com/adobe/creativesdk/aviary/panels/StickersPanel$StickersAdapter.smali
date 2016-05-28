.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;
.super Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
.source "StickersPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StickersAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter",
        "<",
        "Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field idColumnIndex:I

.field identifierColumnIndex:I

.field mContentPath:Ljava/lang/String;

.field mLayoutInflater:Landroid/view/LayoutInflater;

.field packIdColumnIndex:I

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;Landroid/content/Context;Landroid/database/Cursor;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1348
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .line 1349
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 1350
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 1351
    invoke-direct {p0, p3}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->initCursor(Landroid/database/Cursor;)V

    .line 1352
    return-void
.end method

.method private initCursor(Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1369
    if-eqz p1, :cond_1a

    .line 1370
    const-string v0, "item_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->idColumnIndex:I

    .line 1371
    const-string v0, "item_identifier"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->identifierColumnIndex:I

    .line 1372
    const-string v0, "item_packId"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->packIdColumnIndex:I

    .line 1374
    :cond_1a
    return-void
.end method


# virtual methods
.method public getContentPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1359
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->mContentPath:Ljava/lang/String;

    return-object v0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 10
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 1419
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 1420
    .local v0, "cursor":Landroid/database/Cursor;
    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->identifierColumnIndex:I

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .local v2, "identifier":Ljava/lang/String;
    move-object v3, p1

    .line 1422
    check-cast v3, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    .line 1423
    .local v3, "viewHolder":Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
    iput-object v2, v3, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->identifier:Ljava/lang/String;

    .line 1425
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->mContentPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Small:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-static {v2, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getPackItemFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1426
    .local v1, "iconPath":Ljava/lang/String;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mPicassoLib:Lit/sephiroth/android/library/picasso/Picasso;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->access$300(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v4

    .line 1427
    invoke-virtual {v4, v1}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    .line 1428
    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->skipMemoryCache()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .line 1429
    # getter for: Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickerThumbSize:I
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)I

    move-result v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->mStickerThumbSize:I
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lit/sephiroth/android/library/picasso/RequestCreator;->resize(II)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    .line 1430
    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->onlyScaleDown()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    .line 1431
    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->noFade()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    iget-object v5, v3, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->imageView:Landroid/widget/ImageView;

    .line 1432
    invoke-virtual {v4, v5}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V

    .line 1433
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4

    .prologue
    .line 1343
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
    .registers 8
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1379
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    sget v3, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_stickers_item_single:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 1380
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;-><init>(Landroid/view/View;)V

    .line 1382
    .local v0, "holder":Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;

    invoke-direct {v2, p0, v0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1407
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1414
    return-object v0
.end method

.method public setContentPath(Ljava/lang/String;)V
    .registers 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1355
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->mContentPath:Ljava/lang/String;

    .line 1356
    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 3
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .line 1364
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickersAdapter;->initCursor(Landroid/database/Cursor;)V

    .line 1365
    invoke-super {p0, p1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
