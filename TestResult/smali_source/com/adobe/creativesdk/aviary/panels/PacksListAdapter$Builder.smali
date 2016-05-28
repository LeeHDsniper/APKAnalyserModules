.class Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
.super Ljava/lang/Object;
.source "PacksListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private accentColor:I

.field private cache:Lit/sephiroth/android/library/picasso/Cache;

.field private final caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

.field private cellWidth:I

.field private contentResId:I

.field private final context:Landroid/content/Context;

.field private final cursor:Landroid/database/Cursor;

.field private defaultPackTextBackgroundColor:I

.field private dividerResId:I

.field private externalResId:I

.field private internalResId:I

.field private moreResId:I

.field private packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field private picasso:Lit/sephiroth/android/library/picasso/Picasso;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;Landroid/database/Cursor;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "caller"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    .line 79
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->context:Landroid/content/Context;

    .line 80
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->cursor:Landroid/database/Cursor;

    .line 81
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .registers 9

    .prologue
    .line 135
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->context:Landroid/content/Context;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->contentResId:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->moreResId:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->externalResId:I

    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->dividerResId:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->internalResId:I

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->cursor:Landroid/database/Cursor;

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;-><init>(Landroid/content/Context;IIIIILandroid/database/Cursor;)V

    .line 137
    .local v0, "adapter":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->cellWidth:I

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cellWidth:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$002(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;I)I

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$102(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 139
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$202(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lit/sephiroth/android/library/picasso/Picasso;)Lit/sephiroth/android/library/picasso/Picasso;

    .line 140
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$302(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/Cache;

    .line 141
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->defaultPackTextBackgroundColor:I

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->defaultPackTextBackgroundColor:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$402(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;I)I

    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$502(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    .line 143
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->accentColor:I

    # setter for: Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->accentColor:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->access$602(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;I)I

    .line 144
    return-object v0
.end method

.method public setCellWidth(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "cellWidth"    # I

    .prologue
    .line 84
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->cellWidth:I

    .line 85
    return-object p0
.end method

.method public setContentResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "contentResId"    # I

    .prologue
    .line 105
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->contentResId:I

    .line 106
    return-object p0
.end method

.method public setDefaultPackTextBackgroundColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "defaultPackTextBackgroundColor"    # I

    .prologue
    .line 100
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->defaultPackTextBackgroundColor:I

    .line 101
    return-object p0
.end method

.method public setDividerResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "dividerResId"    # I

    .prologue
    .line 120
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->dividerResId:I

    .line 121
    return-object p0
.end method

.method public setExternalResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "externalResId"    # I

    .prologue
    .line 115
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->externalResId:I

    .line 116
    return-object p0
.end method

.method public setInternalResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "internalResId"    # I

    .prologue
    .line 125
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->internalResId:I

    .line 126
    return-object p0
.end method

.method public setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 90
    return-object p0
.end method

.method public setPicasso(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Cache;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 3
    .param p1, "picasso"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p2, "cache"    # Lit/sephiroth/android/library/picasso/Cache;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 95
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 96
    return-object p0
.end method

.method public setSupplyResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "moreResId"    # I

    .prologue
    .line 110
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->moreResId:I

    .line 111
    return-object p0
.end method

.method public setTintColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 130
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->accentColor:I

    .line 131
    return-object p0
.end method
