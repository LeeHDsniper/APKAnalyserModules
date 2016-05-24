.class public interface abstract Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;
.super Ljava/lang/Object;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RequestTransformer"
.end annotation


# static fields
.field public static final IDENTITY:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 84
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer$1;

    invoke-direct {v0}, Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer$1;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;->IDENTITY:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    return-void
.end method


# virtual methods
.method public abstract transformRequest(Lit/sephiroth/android/library/picasso/Request;)Lit/sephiroth/android/library/picasso/Request;
.end method
