.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoStubImpl;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompat.java"

# interfaces
.implements Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityNodeInfoStubImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addAction(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "action"    # I

    .prologue
    .line 319
    return-void
.end method

.method public addChild(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "child"    # Landroid/view/View;

    .prologue
    .line 339
    return-void
.end method

.method public getActions(Ljava/lang/Object;)I
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 353
    const/4 v0, 0x0

    return v0
.end method

.method public getBoundsInParent(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "outBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 359
    return-void
.end method

.method public getBoundsInScreen(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "outBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 364
    return-void
.end method

.method public getClassName(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 378
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentDescription(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 383
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPackageName(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 388
    const/4 v0, 0x0

    return-object v0
.end method

.method public getText(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 398
    const/4 v0, 0x0

    return-object v0
.end method

.method public getViewIdResourceName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 613
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAccessibilityFocused(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 443
    const/4 v0, 0x0

    return v0
.end method

.method public isCheckable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 408
    const/4 v0, 0x0

    return v0
.end method

.method public isChecked(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 413
    const/4 v0, 0x0

    return v0
.end method

.method public isClickable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 418
    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 423
    const/4 v0, 0x0

    return v0
.end method

.method public isFocusable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 428
    const/4 v0, 0x0

    return v0
.end method

.method public isFocused(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 433
    const/4 v0, 0x0

    return v0
.end method

.method public isLongClickable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 448
    const/4 v0, 0x0

    return v0
.end method

.method public isPassword(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 453
    const/4 v0, 0x0

    return v0
.end method

.method public isScrollable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 458
    const/4 v0, 0x0

    return v0
.end method

.method public isSelected(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 463
    const/4 v0, 0x0

    return v0
.end method

.method public isVisibleToUser(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 438
    const/4 v0, 0x0

    return v0
.end method

.method public obtain(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 313
    const/4 v0, 0x0

    return-object v0
.end method

.method public obtainCollectionInfo(IIZI)Ljava/lang/Object;
    .registers 6
    .param p1, "rowCount"    # I
    .param p2, "columnCount"    # I
    .param p3, "hierarchical"    # Z
    .param p4, "selectionMode"    # I

    .prologue
    .line 662
    const/4 v0, 0x0

    return-object v0
.end method

.method public obtainCollectionItemInfo(IIIIZZ)Ljava/lang/Object;
    .registers 8
    .param p1, "rowIndex"    # I
    .param p2, "rowSpan"    # I
    .param p3, "columnIndex"    # I
    .param p4, "columnSpan"    # I
    .param p5, "heading"    # Z
    .param p6, "selected"    # Z

    .prologue
    .line 683
    const/4 v0, 0x0

    return-object v0
.end method

.method public recycle(Ljava/lang/Object;)V
    .registers 2
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 604
    return-void
.end method

.method public setAccessibilityFocused(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "focused"    # Z

    .prologue
    .line 544
    return-void
.end method

.method public setBoundsInParent(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 489
    return-void
.end method

.method public setBoundsInScreen(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 494
    return-void
.end method

.method public setClassName(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "className"    # Ljava/lang/CharSequence;

    .prologue
    .line 509
    return-void
.end method

.method public setClickable(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "clickable"    # Z

    .prologue
    .line 514
    return-void
.end method

.method public setCollectionInfo(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "collectionInfo"    # Ljava/lang/Object;

    .prologue
    .line 638
    return-void
.end method

.method public setCollectionItemInfo(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "collectionItemInfo"    # Ljava/lang/Object;

    .prologue
    .line 647
    return-void
.end method

.method public setContentDescription(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "contentDescription"    # Ljava/lang/CharSequence;

    .prologue
    .line 519
    return-void
.end method

.method public setEnabled(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "enabled"    # Z

    .prologue
    .line 524
    return-void
.end method

.method public setFocusable(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "focusable"    # Z

    .prologue
    .line 529
    return-void
.end method

.method public setFocused(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "focused"    # Z

    .prologue
    .line 534
    return-void
.end method

.method public setLongClickable(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "longClickable"    # Z

    .prologue
    .line 549
    return-void
.end method

.method public setPackageName(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "packageName"    # Ljava/lang/CharSequence;

    .prologue
    .line 554
    return-void
.end method

.method public setParent(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "parent"    # Landroid/view/View;

    .prologue
    .line 559
    return-void
.end method

.method public setScrollable(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "scrollable"    # Z

    .prologue
    .line 569
    return-void
.end method

.method public setSelected(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "selected"    # Z

    .prologue
    .line 574
    return-void
.end method

.method public setSource(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "source"    # Landroid/view/View;

    .prologue
    .line 579
    return-void
.end method

.method public setVisibleToUser(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "visibleToUser"    # Z

    .prologue
    .line 539
    return-void
.end method
