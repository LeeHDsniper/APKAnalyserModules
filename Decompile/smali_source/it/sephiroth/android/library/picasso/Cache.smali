.class public interface abstract Lit/sephiroth/android/library/picasso/Cache;
.super Ljava/lang/Object;
.source "Cache.java"


# static fields
.field public static final NONE:Lit/sephiroth/android/library/picasso/Cache;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    new-instance v0, Lit/sephiroth/android/library/picasso/Cache$1;

    invoke-direct {v0}, Lit/sephiroth/android/library/picasso/Cache$1;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/Cache;->NONE:Lit/sephiroth/android/library/picasso/Cache;

    return-void
.end method


# virtual methods
.method public abstract get(Ljava/lang/String;)Landroid/graphics/Bitmap;
.end method

.method public abstract maxSize()I
.end method

.method public abstract set(Ljava/lang/String;Landroid/graphics/Bitmap;)V
.end method

.method public abstract size()I
.end method
