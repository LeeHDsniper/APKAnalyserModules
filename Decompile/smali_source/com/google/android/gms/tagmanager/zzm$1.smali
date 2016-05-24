.class Lcom/google/android/gms/tagmanager/zzm$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzm$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzm;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tagmanager/zzm$zza",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic zzaOR:Lcom/google/android/gms/tagmanager/zzm;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzm;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzm$1;->zzaOR:Lcom/google/android/gms/tagmanager/zzm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/tagmanager/zzm$1;, "Lcom/google/android/gms/tagmanager/zzm.1;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x1

    return v0
.end method
