.class Lcom/google/android/gms/tagmanager/zzbw;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final zzaQK:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final zzaQL:Z


# direct methods
.method constructor <init>(Ljava/lang/Object;Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzbw;->zzaQK:Ljava/lang/Object;

    iput-boolean p2, p0, Lcom/google/android/gms/tagmanager/zzbw;->zzaQL:Z

    return-void
.end method


# virtual methods
.method public getObject()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzbw;->zzaQK:Ljava/lang/Object;

    return-object v0
.end method

.method public zzAq()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzbw;->zzaQL:Z

    return v0
.end method
