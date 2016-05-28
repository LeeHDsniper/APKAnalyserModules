.class Lcom/google/android/gms/tagmanager/zzba;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tagmanager/zzl",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private zzaQy:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILcom/google/android/gms/tagmanager/zzm$zza;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/tagmanager/zzm$zza",
            "<TK;TV;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/tagmanager/zzba$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/tagmanager/zzba$1;-><init>(Lcom/google/android/gms/tagmanager/zzba;ILcom/google/android/gms/tagmanager/zzm$zza;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzba;->zzaQy:Landroid/util/LruCache;

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/tagmanager/zzba;, "Lcom/google/android/gms/tagmanager/zzba<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzba;->zzaQy:Landroid/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zzf(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzba;->zzaQy:Landroid/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
