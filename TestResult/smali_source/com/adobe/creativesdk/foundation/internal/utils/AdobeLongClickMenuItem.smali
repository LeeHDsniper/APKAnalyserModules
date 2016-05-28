.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;
.super Ljava/lang/Object;
.source "AdobeLongClickMenuItem.java"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field private itemIcon:Landroid/graphics/drawable/Drawable;

.field private itemName:Ljava/lang/String;

.field listener:Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;

.field private priority:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;)V
    .registers 5
    .param p1, "itemName"    # Ljava/lang/String;
    .param p2, "itemIcon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "priority"    # I
    .param p4, "listener"    # Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->itemName:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->itemIcon:Landroid/graphics/drawable/Drawable;

    .line 18
    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->priority:I

    .line 19
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->listener:Lcom/adobe/creativesdk/foundation/internal/utils/IAdobeLongMenuItemClickListener;

    .line 20
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .registers 5
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    .line 36
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;

    .line 37
    .local v0, "item":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;
    iget v1, v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->priority:I

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->priority:I

    if-ne v1, v2, :cond_b

    .line 38
    const/4 v1, 0x0

    .line 42
    :goto_a
    return v1

    .line 39
    :cond_b
    iget v1, v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->priority:I

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->priority:I

    if-ge v1, v2, :cond_13

    .line 40
    const/4 v1, 0x1

    goto :goto_a

    .line 42
    :cond_13
    const/4 v1, -0x1

    goto :goto_a
.end method

.method public getItemIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->itemIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getItemName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 23
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLongClickMenuItem;->itemName:Ljava/lang/String;

    return-object v0
.end method
