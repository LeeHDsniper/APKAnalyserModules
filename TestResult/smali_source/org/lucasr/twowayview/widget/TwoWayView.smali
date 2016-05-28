.class public Lorg/lucasr/twowayview/widget/TwoWayView;
.super Landroid/support/v7/widget/RecyclerView;
.source "TwoWayView.java"


# static fields
.field private static final sConstructorSignature:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field final sConstructorArgs:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 35
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Lorg/lucasr/twowayview/widget/TwoWayView;->sConstructorSignature:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/lucasr/twowayview/widget/TwoWayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/lucasr/twowayview/widget/TwoWayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iput-object v2, p0, Lorg/lucasr/twowayview/widget/TwoWayView;->sConstructorArgs:[Ljava/lang/Object;

    .line 51
    sget-object v2, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_TwoWayView:[I

    const/4 v3, 0x0

    .line 52
    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 54
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_TwoWayView_twowayview_layoutManager:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "name":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1e

    .line 56
    invoke-direct {p0, p1, p2, v1}, Lorg/lucasr/twowayview/widget/TwoWayView;->loadLayoutManagerFromName(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)V

    .line 59
    :cond_1e
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    return-void
.end method

.method private loadLayoutManagerFromName(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 64
    const/16 v5, 0x2e

    :try_start_2
    invoke-virtual {p3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 65
    .local v2, "dotIndex":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_46

    .line 66
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "org.lucasr.twowayview.widget."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 73
    :cond_1c
    :goto_1c
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    invoke-virtual {v5, v6}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 75
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/lucasr/twowayview/TwoWayLayoutManager;>;"
    sget-object v5, Lorg/lucasr/twowayview/widget/TwoWayView;->sConstructorSignature:[Ljava/lang/Class;

    .line 76
    invoke-virtual {v0, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 78
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/lucasr/twowayview/TwoWayLayoutManager;>;"
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/TwoWayView;->sConstructorArgs:[Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 79
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/TwoWayView;->sConstructorArgs:[Ljava/lang/Object;

    const/4 v6, 0x1

    aput-object p2, v5, v6

    .line 81
    iget-object v5, p0, Lorg/lucasr/twowayview/widget/TwoWayView;->sConstructorArgs:[Ljava/lang/Object;

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0, v5}, Lorg/lucasr/twowayview/widget/TwoWayView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 86
    return-void

    .line 67
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/lucasr/twowayview/TwoWayLayoutManager;>;"
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/lucasr/twowayview/TwoWayLayoutManager;>;"
    :cond_46
    if-nez v2, :cond_1c

    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 69
    .local v4, "packageName":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_62} :catch_64

    move-result-object p3

    goto :goto_1c

    .line 82
    .end local v2    # "dotIndex":I
    .end local v4    # "packageName":Ljava/lang/String;
    :catch_64
    move-exception v3

    .line 83
    .local v3, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not load TwoWayLayoutManager from class: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method


# virtual methods
.method public getFirstVisiblePosition()I
    .registers 3

    .prologue
    .line 109
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/TwoWayView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    .line 110
    .local v0, "layout":Lorg/lucasr/twowayview/TwoWayLayoutManager;
    invoke-virtual {v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v1

    return v1
.end method

.method public getLastVisiblePosition()I
    .registers 3

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/TwoWayView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    .line 115
    .local v0, "layout":Lorg/lucasr/twowayview/TwoWayLayoutManager;
    invoke-virtual {v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getLastVisiblePosition()I

    move-result v1

    return v1
.end method

.method public getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;
    .registers 3

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/TwoWayView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    .line 100
    .local v0, "layout":Lorg/lucasr/twowayview/TwoWayLayoutManager;
    invoke-virtual {v0}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getOrientation()Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    move-result-object v1

    return-object v1
.end method

.method public setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .registers 4
    .param p1, "layout"    # Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .prologue
    .line 90
    instance-of v0, p1, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    if-nez v0, :cond_c

    .line 91
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "TwoWayView can only use TwoWayLayoutManager subclasses as its layout manager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_c
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 96
    return-void
.end method

.method public setOrientation(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V
    .registers 3
    .param p1, "orientation"    # Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/lucasr/twowayview/widget/TwoWayView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    .line 105
    .local v0, "layout":Lorg/lucasr/twowayview/TwoWayLayoutManager;
    invoke-virtual {v0, p1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->setOrientation(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;)V

    .line 106
    return-void
.end method
